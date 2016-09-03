require 'rails_helper'

describe "message model" do
  let(:user) { User.create!(username:"jay", email:"jay@gmail.com", password: "1234") }
  let(:user2) { User.create!(username:"jess", email:"jess@gmail.com", password: "password") }
  let(:convo) { Conversation.create(sender_id: user.id, recipient_id: user2.id) }
  let(:msg1) { Message.create(conversation_id: convo.id, body: "Hey, wassup?", user_id: user.id, read: true)}
  let(:msg2) { Message.create(conversation_id: convo.id, body: "Chilling. What are you up to?", user_id: user2.id)}

  let(:saved_user) { User.find_by(username:"jay") }
  let(:saved_user2) { User.find_by(username:"jess") }

  it "belongs to a conversation" do
    expect(msg1.conversation_id).to eq convo.id
  end

  it "has a body" do
    expect(msg1.body).to eq "Hey, wassup?"
  end

  it "has a sender" do
    expect(msg1.user_id).to eq user.id
  end

  it "says whether or not it's been read" do
    expect(msg1.read).to eq true
  end

  it "has a receiver" do
    expect(Conversation.find(msg1.conversation_id).recipient_id).to eq user2.id  
  end

end
