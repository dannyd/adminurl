require 'rubygems'
require 'sinatra'
require 'dm-core'
#require 'dm-more'
require 'dm-validations'
require 'dm-aggregates'
require 'dm-timestamps'

set :port, 8080

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/adminURL.sqlite3")

#DataMapper::Logger.new(STDOUT, :debug) # :off, :fatal, :error, :warn, :info, :debug
DataObjects::Sqlite3.logger = DataObjects::Logger.new(STDOUT, 0)

class Url
	include DataMapper::Resource

	property :id,				 Integer, :serial => true		# primary serial key
	property :url,			 Text,		:nullable => false # cannot be null
	property :description,			 Text,		:nullable => true # can be null
	property :created_at, DateTime
	property :updated_at, DateTime

	#belongs_to :categories

	#validates_present :url
	#validates_length :url, :minimum => 15

	has n, :categorizations
	has n, :categories, :through => :categorizations

end

class Category
	include DataMapper::Resource

	property :id,         Serial
	property :name,       String

	has n, :categorizations
	has n, :urls,      :through => :categorizations
end

class Categorization
	include DataMapper::Resource
	property :id,         Serial
	property :created_at, DateTime

	belongs_to :url
	belongs_to :category
end

DataMapper.auto_upgrade!

use Rack::Auth::Basic do |username, password|
	username == 'admin' && password == 'secret'
end

# new
get '/' do
	@urls = Url.all()
	erb :all
end

get '/test' do
	haml '%div.title Hello World'
end

get %r{/hello1/([\w]+)} do |c|
	"Hello, #{c}!"
end

get %r{/hello2/([\w]+)} do
	"Hello, #{params[:captures].first}!"
end

get '/hello3/:name' do |n|
	"Hello #{n}!"
end

get '/hello4/:name' do
	# matches "GET /foo" and "GET /bar"
	# params[:name] is 'foo' or 'bar'
	"Hello #{params[:name]}!"
end

error do
	'Sorry there was a nasty error - ' + env['sinatra.error'].name
end


############################ 
## Urls
############################ 

get '/new/' do
	erb(:new)
end

# show
get '/:id' do
	@url = Url.get(params[:id])
	if @url
		erb(:show)
	else
		redirect "/wtf/"
	end
end


# create
post '/new/' do
	url = params[:new_url]
	desc = params[:new_desc]
	url = "http://#{url}" unless url.match("://") || url.match("\\\\")

	@url = Url.new(:url => url, :description => desc)
	@url.save
	if @url.save
		redirect "/"
	else
		@url.errors.each do |e|
			e
		end
	end
end

post '/update/:id' do
	urlid = params[:id]
	url = params[:url_url]
	desc = params[:url_desc]
	category = params[:category_id]

	url = "http://#{url}" unless url.match("://") || url.match("\\\\")
	@url = Url.get(urlid)

#	@url.attributes = {:url => url, :description => desc, :category_id => category}
	@url.attributes = {:url => url, :description => desc}

	if category
		@cat = Categorization.get(urlid)
		# || @cat = Categorization.create(:category_id => category.to_i, :url_id => urlid.to_i)
	#	@cat.attributes = {:category_id => category.to_i, :id => urlid.to_i}
		@cat.save
	end
		
	if @url.save
		redirect "/"
	else
		@url.errors.each do |e|
			e
		end
	end
end

# Show all
get '/all/' do
	@urls = Url.all()
	erb :all
end

get '/delete/:id' do
	@url = Url.get(params[:id])
	if @url.destroy
		redirect "/"
	else
		redirect '/wtf/'
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

get '/find/:searchTerm*?' do
	if params[:searchTerm]
	
#http://merb.4ninjas.org/
#	Posts.all :title.like => '%welcome%', :created_at.lt => Time.now
#http://book.merbist.com/en/interacting-with-the-database/queries#read


		@searchTerm = "#{params[:searchTerm]}".chomp	
#		@Url = Url.all(:url.like => '%' + @searchTerm + '%')
		@Urls = Url.all(:conditions => ["url LIKE ? OR description LIKE ?", '%' + @searchTerm + '%', '%' + @searchTerm + '%'])
#		@Url = Url.all(:conditions => ["url LIKE ? OR url LIKE ?", '%#{@searchTerm}%', '%#{@searchTerm}%'])
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

error do
	"Oops! " + request.env["sinatra.error"].message
end
