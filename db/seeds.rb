# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


# run be rake db:reset whenever you make updates to the seed data


user1 = User.create(username: 'holly123', email: "holly@gmail.com", password: "abc123", image_url: Faker::Avatar.image, bio: "I love Austin!", city: "Austin", state: "Texas", zipcode: 78756)
user2 = User.create(username: 'rachel345', email: "iliketoshop@gmail.com", password_digest: "abc123", image_url: Faker::Avatar.image, bio: "I love Austin!", city: "Austin", state: "Texas", zipcode: 78756)
user3 = User.create(username: 'Ross', email: "ross123@hotmail.com", password_digest: "abc123", image_url: Faker::Avatar.image, bio: "I love Austin!", city: "Austin", state: "Texas", zipcode: 78756)
User.create(username: 'Charlie', email: "charlie@gmail.com", password_digest: "abc123", image_url: Faker::Avatar.image, bio: "I love Austin!", city: "Austin", state: "Texas", zipcode: 78756)
User.create(username: 'Lucy', email: "bluedresses4va@gmail.com", password_digest: "abc123", image_url: Faker::Avatar.image, bio: "I love Austin!", city: "Austin", state: "Texas", zipcode: 78756)

i1 = Interest.create(name: "Sports", image_url: "https://www.insidescience.org/sites/default/files/130305_Sports_top.jpg")
i2 = Interest.create(name: "Music", image_url: "https://static.pexels.com/photos/1591/technology-music-sound-things.jpg")
i3 = Interest.create(name: "Food", image_url: "https://format-com-cld-res.cloudinary.com/image/private/s--gDK9kYDW--/c_limit,g_center,h_65535,w_1600/a_auto,fl_keep_iptc.progressive,q_95/226561-11543623-Blackened_Chicken_Emily_Caruso_Photography_1_of_1_jpg.jpg")
Interest.create(name: "Fitness", image_url: "https://snap-photos.s3.amazonaws.com/img-thumbs/960w/3H89EH3WIJ.jpg")
Interest.create(name: "Politics", image_url: "https://snap-photos.s3.amazonaws.com/img-thumbs/960w/RFKY6O3X2G.jpg")
Interest.create(name: "Books", image_url: "https://obsessivebookworm.files.wordpress.com/2011/01/books.jpg")

user1.interests << i1
user1.interests << i2

user2.interests << i1
user2.interests << i3

user3.interests << i2
user3.interests << i3

convo1 = Conversation.create(sender_id: user1.id, recipient_id: user2.id)
message1 = Message.create(conversation_id: convo1.id, body: "Hey, wassup?", user_id: user1.id, read: true)
message2 = Message.create(conversation_id: convo1.id, body: "Chilling. What are you up to?", user_id: user2.id)

convo2 = Conversation.create(sender_id: user2.id, recipient_id: user3.id)
message3 = Message.create(conversation_id: convo2.id, body: "You going out tonight?", user_id: user2.id, read: true)
message4 = Message.create(conversation_id: convo2.id, body: "Only if you go.", user_id: user3.id)
