class Message < ActiveRecord::Base

	validates :body, presence: true
	validates :user_id, presence: true

	def self.all_messages(gps)
		x=0.0000100
		Message.where(
			latitude: gps[0]-x..gps[0]+x,
			longitude: gps[1]-x..gps[1]+x
			)
	end
end
