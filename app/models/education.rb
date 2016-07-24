class Education < ActiveRecord::Base
  belongs_to :society, dependent: :destroy
end
