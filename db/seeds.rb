# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(username: 'holly123', email: "holly@gmail.com", password_digest: "abc123")
user2 = User.create(username: 'rachel345', email: "iliketoshop@gmail.com", password_digest: "abc123")
user3 = User.create(username: 'Ross', email: "ross123@hotmail.com", password_digest: "abc123")
User.create(username: 'Charlie', email: "charlie@gmail.com", password_digest: "abc123")
User.create(username: 'Lucy', email: "bluedresses4va@gmail.com", password_digest: "abc123")

i1 = Interest.create(name: "Sports")
i2 = Interest.create(name: "Music")
i3 = Interest.create(name: "Food")
Interest.create(name: "Fitness")
Interest.create(name: "Politics")
Interest.create(name: "Books")

user1.interests.create(name: "Sports")
user1.interests.create(name: "Music")

user2.interests.create(name: "Sports")
user2.interests.create(name: "Food")

user3.interests.create(name: "Food")
user3.interests.create(name: "Music")

convo1 = Conversation.create(sender_id: user1.id, recipient_id: user2.id)
message1 = Message.create(conversation_id: convo1.id, body: "Hey, wassup?", user_id: user1.id)
message2 = Message.create(conversation_id: convo1.id, body: "Chilling. What are you up to?", user_id: user2.id)

convo2 = Conversation.create(sender_id: user2.id, recipient_id: user3.id)
message1 = Message.create(conversation_id: convo2.id, body: "Hey, wassup?", user_id: user2.id)
message2 = Message.create(conversation_id: convo2.id, body: "Chilling. What are you up to?", user_id: user3.id)
