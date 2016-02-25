class Apikey < ActiveRecord::Base
    validates :name,
              :presence => {:message =>"Name can't be empty"},
              :length => {:minimum =>6, :message => "Username must be at least 6 keys" },
              :length => {:maximum => 20, :message => "Username cannot be longer than 20 characters"}

    validates :about,
              :presence => {:message =>"About can't be empty"},
              :length => {:minimum =>6, :message => "About must be at least 6 keys" },
              :length => {:maximum => 200, :message => "Username cannot be longer than 200 characters"}

  belongs_to :user

end
