class Apikey < ActiveRecord::Base
  validates :name,
            :presence => {:message => "Name can't be empty"},
            :length => {:minimum => 6, :maximum => 50, :message => "Name must be between 6 and 20 characters long"}

  validates :about,
            :presence => {:message => "About can't be empty"},
            :length => {:minimum => 6, :maximum => 200, :message => "About must be between 6 and 200 charachers long"}
  validates :api_key,
            :uniqueness => true

  belongs_to :user

end
