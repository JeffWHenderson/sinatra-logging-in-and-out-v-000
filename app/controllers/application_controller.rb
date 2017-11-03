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
    params[:username]  #set equal to session ID
    params[:password]  #encrypt password
    redirect :index    # displays the correct balance based on session[:user_id]
  end                 # display logout
                      #shows the error page if username and ID do not match available users
  get '/account' do
        # shows the error page if user goes directly to /account
        # displays the account information if a user is logged in
  end

  get '/logout' do
    session.clear
    redirect :'/'
  end


end
