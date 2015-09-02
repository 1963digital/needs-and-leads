require 'sinatra/base'
require 'sinatra/activerecord'

require_relative './models/need'
require_relative './models/lead'

class NeedsAndLeads < Sinatra::Base

  set :database_file, "./config/database.yml"

  get '/' do
  	@needs = Need.all
    erb :index
  end

  post '/need' do
  	Need.create(title: params[:title], description: params[:description])
  	redirect to('/')
  	erb :index
  end

  get '/need/new' do
  	erb :'need/new'
  end

  get '/need/:id' do
  	@needs = Need.all
  	@need_id = params[:id]
  	@need = Need.find_by_id(@need_id)
  	erb :'need/show'
  end

  post '/lead' do
  	Lead.create(message: params[:reply], need_id: params[:need])
  	redirect to('/')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
