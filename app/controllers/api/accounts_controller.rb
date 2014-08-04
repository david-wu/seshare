class Api::AccountsController < ApplicationController
	
	def index
		@accounts = Account.all
		render json: @accounts
	end

	def show
		@account = Account.find(params[:id])
		render json: {account: @account}
	end

	def create
		@account = Account.new(account_params)
		@user = User.find_by(session_token: params[:account][:session_token])
		if @user
			@account.user_id = @user.id
		end
		if @account.save
			render json: @account
		else
			render json: @account.errors.full_messages, status: 400
		end
	end

	def account_params
		params.require(:account).permit(:url, :user_id, :domain, :cookie, :title, :description)
	end

end
