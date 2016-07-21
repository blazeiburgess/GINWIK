class Society < ActiveRecord::Base
  has_many :social_groups
  belongs_to :user

end
