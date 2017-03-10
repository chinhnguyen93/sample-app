class User < ApplicationRecord
	before_save {self.email=email.downcase}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.+[a-z]+\z/i
	validates :name, presence: true, length: {maximum: 25} 
	validates :email, presence: true, length: {maximum: 25}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensetive: false}
	validates :password, presence: true, length: {minimum: 6}
	has_secure_password
end
