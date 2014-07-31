class Account < ActiveRecord::Base

	belongs_to :user

	validates :user_id, presence: true
	validates :domain, presence: true
	validates :cookie, presence: true
	
end