class Society < ActiveRecord::Base
  has_many :social_groups
  has_many :conflicts
  belongs_to :user
  Helpers::METHODS.each do |method|
    has_one method, dependent: :destroy
  end
end
