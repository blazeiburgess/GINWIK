module Helpers
  def current_user(session)
    User.find(session[:user_id])
  end
  def is_logged_in?(session)
    !!current_user(session)
  end
  def all_usernames
    User.all.map(&:username)
  end
end
