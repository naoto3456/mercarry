class UsersController < ApplicationController
	def index
		
	end

	def new
		@user = User.new
	end

	def create
		byebug
		@user = User.new(user_params)
		@user.save
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :hashed_password, :description)
	end

end
