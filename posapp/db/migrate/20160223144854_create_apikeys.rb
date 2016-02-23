class CreateApikeys < ActiveRecord::Migration
  def change
    create_table :apikeys do |t|
      t.string :name
      t.string :api_key
      t.string :about
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
