class History < ActiveRecord::Base
  belongs_to :society, dependent: :destroy
end
