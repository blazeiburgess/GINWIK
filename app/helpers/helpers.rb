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
  def get_class_name(str)
    Kernel.const_get(str.split("_").map(&:capitalize).join)
  end
  def method_name_to_plain_language(method)
    method.to_s.split("_").map(&:capitalize).join(" ")
  end
  def get_params_method(params)
    params[params[:method].to_sym]
  end
  def clean_attrs_of_ids(instance_method, society=nil)
    hash = instance_method.attributes.reject_if {|attr| attr.include?("id")}
    if society
      hash[:society_id] = society.id
    end
  end
  def migrate_conflict(conflict, society)
    old_social_group_1 = SocialGroup.find(conflict.group_1_id)
    old_social_group_2 = SocialGroup.find(conflict.group_2_id)
    society.social_groups.each {|sg| info["group_1_id"] = sg.id if sg.description == old_social_group_1.description}
    society.social_groups.each {|sg| info["group_2_id"] = sg.id if sg.description == old_social_group_2.description}
  end
end
