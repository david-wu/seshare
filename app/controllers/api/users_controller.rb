class Api::UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		render json: @user
	end

	def create
		p params
		@user = User.new(user_params)
		if @user.save
			render json: @user
		else
			render json: @user.errors.full_messages, status: 400
		end
	end

	def sign_in
		p params
		@user = User.find_by(email: user_params[:email])
		if @user && @user.is_password?(user_params[:password])
			render json: @user
		else
			render json: ['invalid login'], status:400
		end
	end

	def user_params
		params.require(:user).permit(:email, :first_name, :last_name, :password, :credit)
	end

end
