#encoding: utf-8
class UsersController < ApplicationController

  def show
  	@user = User.find_by(id: params[:id]) || User.find_by(name:params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	user = User.create(params.require(:user).permit(:name))
  	sign_in(user)
  	flash[:success] = "Ура Вы зарегились и авторизовались!"
  	redirect_to user
  end
  
end
