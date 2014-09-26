class ChangeGpsFromMessage < ActiveRecord::Migration
  def change
  	remove_column :messages, :gps
  	add_column :messages, :latitude, :decimal, precision: 8, scale: 2
  	add_column :messages, :longitude, :decimal, precision: 8, scale: 2
  end
end
