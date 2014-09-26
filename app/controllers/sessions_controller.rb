class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(id: params[:session][:id], name: params[:session][:name])
  	if user
  		sign_in user
      	redirect_to user
  	else
		flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
    	render 'new'
  	end
  end

  def destroy
  	sign_out
    redirect_to root_url
  end
end
