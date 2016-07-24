class SocialGroup < ActiveRecord::Base
  belongs_to :society, dependent: :destroy
end
