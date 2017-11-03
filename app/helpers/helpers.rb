class Helpers

  def current_user(session)
     User.find_by(session[:user])
  end

  def is_logged_in?(session)
    
  end
end
