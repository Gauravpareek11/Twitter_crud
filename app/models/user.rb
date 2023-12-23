# frozen_string_literal: true

# This is User Model
class User < ApplicationRecord
  before_create :downcase_email
  has_many :posts
  has_secure_password 
  validates :name, presence: { message: 'Name Can\'t be empty' }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Invalid Email' },
                    uniqueness: { message: 'Already exist', case_sensitive: false },
                    presence: { message: 'Email can\'t be empty' }
  validates :password_digest, presence: { message: 'Password Can\'t be empty' }
  def downcase_email
    self.email = email.downcase
  end
end
