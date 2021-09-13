# frozen_string_literal: true

require 'faker'

User.create(nick: 'nick1', email: 'test@test.com', password: '123456abc@') unless User.exists? nick: :nick1
User.create(nick: 'nick2', email: 'john_doe@mail.com', password: '123456abc@') unless User.exists? nick: :nick2

User.all.each do |user|
  User.where.not(id: user.id).each do |user_|
    Message.create(mailer: user, receiver: user_, content: Faker::Lorem.sentence)
  end
end
