class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :about
      t.datetime :event_time
      t.belongs_to :creator, index: true
      t.belongs_to :position, index: true
      t.timestamps
    end
  end
end
