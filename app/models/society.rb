class Society < ActiveRecord::Base
  has_many :social_groups
  has_many :conflicts
  belongs_to :user
  has_one :technological_development
  has_one :culture
  has_one :economic_organization
  has_one :education
  has_one :environment
  has_one :governmental_organization
  has_one :history
  has_one :language
  has_one :social_group 
end
