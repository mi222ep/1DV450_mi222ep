class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :token
      t.string :auth_token
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :token_expires
      t.timestamps
    end
  end
end
