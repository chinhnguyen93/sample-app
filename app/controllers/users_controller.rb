class UsersController < ApplicationController
  def new
  	@user=User.new
  end
  def show
  	@user=User.find_by_id(params[:id])
  end
  def create
  	@user=User.new(params_user)
  	if @user.save
      long_in @user
  		flash[:success] = "Welcome to the Sample App!"
  		redirect_to user_path(@user)
  	else
  		render 'new'
  	end
  end


  private
  def params_user
  	params.require(:user).permit(:name,:email,:password, :password_confirmation)
  end
end
