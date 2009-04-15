require 'rubygems'
require 'data_mapper'
#require 'dm-core'
require 'dm-validations'
require 'dm-aggregates'
require 'dm-timestamps'
require 'sinatra'

set :port, 8080

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/adminURL.sqlite3")

DataMapper::Logger.new(STDOUT, :debug) # :off, :fatal, :error, :warn, :info, :debug
DataObjects::Sqlite3.logger = DataObjects::Logger.new(STDOUT, 0)

class Url
	include DataMapper::Resource

	property :id,				 Integer, :serial => true		# primary serial key
	property :url,			 Text,		:nullable => false # cannot be null
	property :description,			 Text,		:nullable => true # can be null
	property :created_at, DateTime
	property :updated_at, DateTime

	before :save, :markup_url

	def markup_url
		# default urls will be http, unless specified
		self.url = "http://#{url}" unless url.match("://") || url.match("\\\\")
	end

end

class Category
  include DataMapper::Resource
  property :id,       Serial
  property :name,     String
end

class Categorization
  include DataMapper::Resource
  property :id,       Serial
  belongs_to :category
  belongs_to :url
end

class Url
  has n, :categorizations
  has n, :categories, :through => :categorizations
end
 
class Category
  has n, :categorizations
  has n, :urls,      :through => :categorizations
end

DataMapper.auto_upgrade!
## NEVER RUN auto_migrate - DELETES TABLES 
## DataMapper.auto_migrate!

use Rack::Auth::Basic do |username, password|
	username == 'admin' && password == 'secret'
end


############################ 
## Urls
############################ 

get '/' do
	@urls = Url.all()
	@newUrl = Url.new
	erb :all
end

get '/new/' do
	@newUrl = Url.new
	erb(:new)
end

get '/:id' do
	@url = Url.get(params[:id])
	if @url
		erb(:show)
	else
		redirect "/wtf/"
	end
end

post '/new/' do
	@newUrl = Url.new(params[:newUrl])
	if @newUrl.save
		redirect "/"
	else
		erb(:all)
	end
end

get '/edit/:id' do
	@url = Url.get(params[:id])
	@categories = Category.all()

	if @url
		erb(:edit)
	else
		redirect "/wtf/"
	end
end

post '/update/:id' do
	categories = params[:categories]
	@url = Url.get(params[:id])
	@url.update_attributes(params[:url])

	#@flash = "Added to categories:<br>"
	#@url.categorizations = []
	Categorization.all(:url_id => params[:id]).destroy!
	if categories
		categories.each do |catHashKey,catHashVal|
			catHashVal.each do |cat|
				#@flash = @flash + " - " + Category.get( cat ).name + "<br>"
				Categorization.create(:category_id => Category.get( cat ).id, :url_id => @url.id)
			end
		end
	end
			
	if @url.save
		@saveSuccessful = true
		@categories = Category.all()
		@flash = "Save was successful"
		erb(:edit)
	else
		@url.errors.each do |e|
			e
		end
	end
end

post '/updatesav/:id' do
	urlid = params[:id]
	url = params[:url_url]
	desc = params[:url_desc]
	category = params[:category_id]

	url = "http://#{url}" unless url.match("://") || url.match("\\\\")
	@url = Url.get(urlid)

	@url.attributes = {:url => url, :description => desc}
	
	if @url.save
		redirect "/"
	else
		@url.errors.each do |e|
			e
		end
	end
end

get '/delete/:id' do
	@url = Url.get(params[:id])
	if @url.destroy
		redirect "/"
	else
		redirect '/wtf/'
	end
end

get '/find/:searchTerm*?' do
	if params[:searchTerm]
		@searchTerm = "#{params[:searchTerm]}".chomp	
		@Urls = Url.all(:conditions => ["url LIKE ? OR description LIKE ?", '%' + @searchTerm + '%', '%' + @searchTerm + '%'])
	else
		redirect "/"
	end		

	if @Urls
		erb(:all)
	else
		redirect "/"
	end
end

############################ 
## Categories
############################ 

get '/cats/' do
	@categories = Category.all()
	erb :allcats
end

post '/cats/new/' do

	cat = params[:new_cat]

	@cat = Category.new(:name => cat)
	@cat.save
	if @cat.save
		redirect "/cats/"
	else
		@url.errors.each do |e|
			e
		end
	end
end

get '/cats/edit/:id' do
	@cat = Category.get(params[:id])
	if @cat
		erb(:editcat)
	else
		redirect "/wtf/"
	end
end

post '/cats/update/:id' do
	cat = params[:cat_name]
	@cat = Category.get(params[:id])

	"Not Found" if !@cat
	"Found!" if @cat
	
	@cat.attributes = {:name => cat}

	if @cat.save
		redirect "/cats/"
	else
		@url.errors.each do |e|
			e
		end
	end
end

get '/cats/delete/:id' do
	@cat = Category.get(params[:id])
	if @cat.destroy
		redirect "/cats/"
	else
		redirect '/wtf/'
	end
end

# Show wtf
get '/wtf/' do
	"What the fuck?"
end

#error do
#	"Oops! " + request.env["sinatra.error"].message
#end
