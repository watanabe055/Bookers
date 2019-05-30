class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index, :edit]

  	def show
    	@user = User.find(params[:id])
    	@books = Book.all
  	 	@book = Book.new
  	end

	def edit
	    @user = User.find(params[:id])
	    if  @user.id != current_user.id
	    	redirect_to user_path(current_user)
	    end
	end

	def index
    	@books = Book.all
    	@book = Book.new
      	@user = current_user
		@users = User.all
	end

	def update
	    @user = User.find(params[:id])
	    if @user.update(user_params)
	    	redirect_to user_path(@user)
	    	flash[:notice] = "You have updated user successfully."
		else
			render 'edit'
		end
	end

	private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
