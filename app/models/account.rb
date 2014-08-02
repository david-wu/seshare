class Account < ActiveRecord::Base

	belongs_to :user

	validates :domain, presence: true
	validates :cookie, presence: true
	
end