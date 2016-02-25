class User < ActiveRecord::Base
  has_secure_password
  validates :name,
            :presence => {:message =>"Name can't be empty"},
            :length => {:minimum =>6, :message => "Username must be at least 6 keys" }


  has_many :applications
end
