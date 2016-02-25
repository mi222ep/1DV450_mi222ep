class User < ActiveRecord::Base
  has_secure_password
  validates :name,
            :presence => {:message =>"Name can't be empty"},
            :length => {:minimum =>6, :message => "Username must be at least 6 keys" },
            :length => {:maximum => 20, :message => "Username cannot be longer than 20 characters"}


  has_many :applications
end
