class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, :null => false
      t.string :about, :null => false
      t.datetime :event_time, :null=> false
      t.belongs_to :creator, index: true, :null=> false
      t.belongs_to :position, index: true, :null=> false
      t.timestamps
    end
  end
end
