class UsersController < ApplicationController
	def index
		
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find_by_id(params[:id])
	end

	def create
		@user = User.new(user_params)
		@user.save
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :description)
	end

end
