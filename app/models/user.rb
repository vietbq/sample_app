class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :name, presence: true, lenght: { maximum: 50}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, lenght: { maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: uniqueness: { case_sensitive: false }

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
end
