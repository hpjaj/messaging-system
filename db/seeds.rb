require 'faker'

User.destroy_all
Message.destroy_all
Conversation.destroy_all


# Create Users
user = User.new(
  name:     'John Smith',
  email:    'john@example.com',
  password: 'password'
  )
user.skip_confirmation!
user.save

user = User.new(
  name:     'Alex Roberts',
  email:    'alex@example.com',
  password: 'password'
  )
user.skip_confirmation!
user.save

14.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: 'password'
    )
  user.skip_confirmation!
  user.save
end
users = User.all 

# Create Messages
200.times do 
  message = Message.create!(
    user_id:    users.sample.id,
    recipient_id:  users.sample.id,
    body:       Faker::Lorem.paragraph(20)
  )
end

100.times do 
  conversations = Conversation.create!(
    user_id:   users.sample.id,
    recipient_id: users.sample.id
  )
end


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Message.count} messages created"
puts "#{Conversation.count} conversations created"
