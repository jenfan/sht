class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
	  t.string :remember_token
      t.timestamps
    end
    add_index  :users, :remember_token
  end
  def self.down
    drop_table :users
  end
end
