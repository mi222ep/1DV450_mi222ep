class Apikey < ActiveRecord::Base
    validates :name,
              :presence => {:message =>"Name can't be empty"},
              :length => {:minimum =>6, :maximum => 20, :message => "Name must be between 6 and 20 characters long"}

    validates :about,
              :presence => {:message =>"About can't be empty"},
              :length => {:minimum =>6, :maximum => 200, :message => "About must be between 6 and 200 charachers long"}

  belongs_to :user

end
