require 'rubygems'
#require 'data_mapper'
require 'dm-core'
#require 'dm-validations'
require 'dm-aggregates'
require 'dm-timestamps'
require 'model'
require 'sinatra'

############################ 
## Configuration
############################ 
#   username for HTTP authentication
@httpPort = 8080

#   username for HTTP authentication
@authUsername = 'admin'

#   password for HTTP authentication
@authPassword = 'secret'

############################ 
## End of Configuration
############################ 


set :port, 8080

use Rack::Auth::Basic do |username, password|
	username == @authUsername && password == @authPassword
end


############################ 
## Urls
############################ 

get '/' do
	@urls = Url.all()
	erb(:all)
end

get '/new/' do
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
	Categorization.all(:url_id => @url.id).destroy!
	if @url.destroy
		@saveSuccessful = true
		@flash = "Delete was successful"
		erb(:edit)
	else
		redirect '/wtf/'
	end
end

get '/find/*' do
	if params[:search_url]
		@searchTerm = "#{params[:search_url]}".chomp	
		@urls = Url.all(:conditions => ["url LIKE ? OR description LIKE ?", '%' + @searchTerm + '%', '%' + @searchTerm + '%'])
	else
		redirect "/"
	end		

	if @urls
		erb(:all)
	else
		redirect "/"
	end
end

get '/cat/:cat' do
	redirect "/" if params[:cat].to_s == "*"
	@urls = Categorization.all(:category_id => params[:cat]).url
	erb(:all)
end


############################ 
## Categories
############################ 

get '/cats/' do
	@categories = Category.all()
	erb(:allcats)
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
	Categorization.all(:category_id => @cat.id).destroy!
	if @cat.destroy
	
		redirect "/cats/"
	else
		redirect '/wtf/'
	end
end

# Show wtf
get '/wtf/' do
	"What the?"
end

