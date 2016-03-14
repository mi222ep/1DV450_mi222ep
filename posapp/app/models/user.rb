class User < ActiveRecord::Base
  has_secure_password
  validates :name,
            :presence => {:message => "Name can't be empty"},
            :length => {:minimum => 6, :maximum => 20, :message => "Username must be between 6 and 20 characters"},
            :uniqueness => {case_sensitive: false}

  has_many :apikeys
end
