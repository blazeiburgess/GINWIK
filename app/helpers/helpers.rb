module Helpers
  METHODS = [:culture, :economic_organization, :education, :environment, :governmental_organization, :history, :language, :technological_development]
  def current_user(session)
    User.find(session[:user_id]) if session[:user_id]
  end
  def is_logged_in?(session)
    !!current_user(session)
  end
  def all_usernames
    User.all.map(&:username)
  end
  def get_id(slug)
    slug.split("_")[-1]
  end
  def get_slug(society)
    "#{society.name + "_" + society.id.to_s}"
  end
end
