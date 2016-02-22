class User < ActiveRecord::Base
  has_secure_password
  validates :name,
            :presence => {:message =>"Du måste ange ett namn"}

  has_many :applications
end
