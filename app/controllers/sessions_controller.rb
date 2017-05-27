class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		puts params[:email]
		redirect_to users_path
	end

	private
	def sessions_params
		params.require(:user).permit(:email, :hashed_password)
	end
end
