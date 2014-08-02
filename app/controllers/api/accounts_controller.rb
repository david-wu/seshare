class Api::AccountsController < ApplicationController
	
	def index
		@accounts = Account.all
		render json: {accounts: @accounts}
	end

	def show
		@account = Account.find(params[:id])
		render json: {account: @account}
	end

	def create
		@account = Account.new(account_params)
		p @account
		if @account.save
			render json: {account: @account}
		else
			render json: {errors: @account.errors.full_messages}
		end
	end

	def account_params
		params.require(:account).permit(:user_id, :domain, :cookie, :title, :description)
	end

end
