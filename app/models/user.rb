class User < ActiveRecord::Base

	include BCrypt

	has_many :accounts

	validates :email, presence: true, uniqueness: true
	validates :password, length: { minimum: 6, allow_nil: true}
	validates :password_digest, presence: true, uniqueness: true
	validates :credit, presence: true

	before_validation :ensure_session_token
	before_validation :ensure_credit
	
	def ensure_session_token
		self.session_token ||= SecureRandom.urlsafe_base64(16)
	end

	def ensure_credit
		self.credit ||= 0
	end

	def password=(pass)
		@password = pass
		self.password_digest = BCrypt::Password.create(@password)
	end

	def is_password?(pass)
		bc = BCrypt::Password.new(self.password_digest)
		bc.is_password?(pass)
	end

	def password
		@password
	end

end
