class TechnologicalDevelopment < ActiveRecord::Base
  belongs_to :society, dependent: :destroy
end
