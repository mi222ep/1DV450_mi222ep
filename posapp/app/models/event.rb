class Event < ActiveRecord::Base
  has_and_belongs_to_many :tags
  belongs_to :creator
  belongs_to :position

  def serializable_hash (options={})
    options = {
        only: [:id, :name, :about, :event_time],
        include: [tags: {only: [:name, :id]}],
        methods: [:position_info, :creator_info, :links]
    }.update(options)
    super(options)

  end

  def position_info
    position = self.position
    {
        longitude: position.longitude,
        latitude: position.latitude
    }
  end

  def creator_info
    creator = self.creator
    {
        name: creator.name
    }
  end
  def links
    event = self
    {
        rel: "self",
        href: "http:localhost:3000/events/" + event.id.to_s
    }
  end

end
