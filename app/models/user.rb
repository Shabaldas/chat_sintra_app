# frozen_string_literal: true

# User model
class User < ActiveRecord::Base
  has_secure_password

  validates :nick, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }

  def messages
    Message.where(mailer: self).or(Message.where(receiver: self))
  end
end
