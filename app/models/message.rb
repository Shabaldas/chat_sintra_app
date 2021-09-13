# frozen_string_literal: true

# Message model
class Message < ActiveRecord::Base
  belongs_to :mailer, class_name: 'User'
  belongs_to :receiver, polymorphic: true

  validates :mailer, presence: true
  validates :receiver, presence: true
  validates :content, presence: true
end
