class UsersController < ApplicationController
	def index
		
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.save
	end

	def edit
		@user = User.find_by_id(params[:id])
	end

	def update
		@user = User.find_by_id(params[:id])
		if @user.update(user_params)
			byebug
			flash[:notice] = 'udated your profile successfully'
			redirect_to listings_path
		else
			flash.now[:notice] = 'error'
			render :edit
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :avatar, :description)
	end

end
