class User < ActiveRecord::Base
  has_many :societies
  has_secure_password
end
