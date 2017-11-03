require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    #should I create a user here, then I should save and get its ID from the table
    params[:username]
    params[:password]
    redirect :index
  end

  get '/account' do

  end

  get '/logout' do

  end


end
