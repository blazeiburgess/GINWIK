class GovernmentalOrganization < ActiveRecord::Base
  belongs_to :society, dependent: :destroy
end
