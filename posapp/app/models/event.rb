class Event < ActiveRecord::Base
  has_and_belongs_to_many :tags
  belongs_to :creator
  belongs_to :position

  def serializable_hash (options={})
    options = {
        only: [:id, :name, :about, :event_time],
        include: [position: {only: [:longitude, :latitude]}],
        include: [tags: {only: [:name, :id]}],
        include: [creator: {only: [:name]}]

    }.update(options)
    super(options)

  end

end
