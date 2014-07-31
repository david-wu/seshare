class User < ActiveRecord::Base
	include BCrypt

	validates :email, presence: true, uniqueness: true
	validates :username, presence: true, uniqueness: true
	validates :password, length: { in: 6..12, allow_nil: true}
	validates :password_digest, presence: true, uniqueness: true
	before_create :ensure_session_token

	def ensure_session_token
		self.session_token ||= SecureRandom.urlsafe_base64(16)
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
