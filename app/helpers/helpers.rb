class Helpers

  def current_user(session)
     User.find_by(session[:user_id])
  end

  def is_logged_in?(session)
    !!session[user_id]
  end
end
