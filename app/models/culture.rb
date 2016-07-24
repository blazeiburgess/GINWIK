class Culture < ActiveRecord::Base
  belongs_to :society, dependent: :destroy
end
