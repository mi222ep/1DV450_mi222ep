class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer "longitude"
      t.integer "latitude"
      t.timestamps
    end
  end
end
