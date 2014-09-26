class MessageController < ApplicationController
	
	def index
		@msgs = Message.all_messages(user_gps)
		# @msgs = Message.all
	end

	def get_msg(gps)
		Message.all_messages(gps)
	end

	def create_msg
		Message.create(msg_params)
		# render 'create_msg.js'
		# render json:msg_params
		flash[:warning] = msg_params.to_json
		# render json:user_gps[0]
	end

	def save_gps
		# save_gps(gps_params)
		flash[:warning] = gps_params.to_json
	end

	private

	    def user_gps
	    	split_gps(get_gps_string_token)
	    end

	    def save_gps(gps_string)
	    	set_gps_string_token(gps_string)
	    end

	    def split_gps(arg)
	    	arg.split(', ').map{|x| x.to_f}
	    end

		def msg_params
		 return unless current_user
	      params[:user_id] = current_user.id
	      unless params[:gps].blank?
	      	  gps = split_gps(params[:gps])
		      params[:latitude] = gps[0]
		      params[:longitude] = gps[1]
	      else #if params[:latitude] and params[:longitude]
			  gps = user_gps
		      params[:latitude] = gps[0]
		      params[:longitude] = gps[1]
	      end
	      params.permit(:body, :latitude, :longitude, :user_id)
	    end

	    def gps_params
	    	params.permit(:gps)
	    end
end
