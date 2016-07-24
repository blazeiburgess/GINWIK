class EconomicOrganization < ActiveRecord::Base
  belongs_to :society, dependent: :destroy
end
