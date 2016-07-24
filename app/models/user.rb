class User < ActiveRecord::Base
  has_many :societies, dependent: :destroy
  has_secure_password
end
