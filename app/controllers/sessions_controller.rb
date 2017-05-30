class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.find_by_email(params[:email])
		
		if @user.nil?
			flash.now[:error] = "Login failed, Please confirm your email address and password!"
			render 'new'
		else
			if @user.password == params[:password]
				puts 'OK'
				session[:user_id] = @user.id
				#redirect_to listings_path :flash => { :success => "Login succeed!" }
				flash[:notice] = "Login succeed!"
				redirect_to listings_path 
			else
				flash.now[:error] = "Login failed, Please confirm your email address and password!"
				render 'new'
			end
		end 
	end

	def create_from_omniauth
		flash[:notice] = "Login succeed!"
		redirect_to listings_path
	end

	def destroy
		session[:user_id] = nil
		flash[:error] = "Logout succeed!"
		redirect_to new_session_path
	end

	private
	def sessions_params
		params.require(:user).permit(:email, :password)
	end
end
