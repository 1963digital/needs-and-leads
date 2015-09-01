require 'sinatra/base'
require 'data_mapper_setup'

class NeedsAndLeads < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
  	#datamapper.create(title: params[:title], description: params[:description])
  	redirect to('/')
  	erb :index
  end

  get '/need/new' do
  	erb :'need/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
