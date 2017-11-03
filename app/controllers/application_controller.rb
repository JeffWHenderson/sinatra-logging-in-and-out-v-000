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
    user = User.find_by(params)
    if user
      session[:user_id] = user.id
      redirect :'/account'
    else
      erb :'error'
    end             #shows the error page if username and ID do not match available users
  end

  get '/account' do
        # shows the error page if user goes directly to /account
        # displays the account information if a user is logged in
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      erb :account
    else
      erb :'error'
    end
  end

  get '/logout' do
    session.clear
    redirect :'/'
  end


end
