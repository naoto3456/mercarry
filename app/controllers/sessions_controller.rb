class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.find_by_email(params[:email])
		if @user.password == params[:password]
			puts 'OK'
			session[:user_id] = @user.id
		else
			puts 'NG'
		end 
		redirect_to users_path
	end

	def destroy
		session[:user_id] = nil
	end

	private
	def sessions_params
		params.require(:user).permit(:email, :password)
	end
end
