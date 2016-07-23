module Helpers
  METHODS = [:culture, :economic_organization, :education, :environment, :governmental_organization, :history, :language, :technological_development]
  # METHODS = Society.first.methods.grep(/autosave/).map {|entry| entry.to_s.gsub("autosave_associated_records_for_", "").to_sym}.delete_if {|entry| [:user, :changed_for_autosave?, :social_group, :social_groups].include?(entry)}
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
