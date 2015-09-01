require 'sinatra/base'
require 'sinatra/activerecord'

require_relative './models/need'

class NeedsAndLeads < Sinatra::Base

  set :database_file, "./config/database.yml"

  get '/' do
  	@needs = Need.all
    erb :index
  end

  post '/' do
  	Need.create(title: params[:title], description: params[:description])
  	redirect to('/')
  	erb :index
  end

  get '/need/new' do
  	erb :'need/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
