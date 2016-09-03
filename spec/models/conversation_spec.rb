require 'rails_helper'

describe "conversation model" do
  let(:user) { User.create!(username:"jay", email:"jay@gmail.com", password: "1234") }
  let(:user2) { User.create!(username:"jess", email:"jess@gmail.com", password: "password") }
  let(:convo) { Conversation.create(sender_id: user.id, recipient_id: user2.id) }
  let(:msg1) { Message.create(conversation_id: convo.id, body: "Hey, wassup?", user_id: user.id, read: true)}
  let(:msg2) { Message.create(conversation_id: convo.id, body: "Chilling. What are you up to?", user_id: user2.id)}


  it "has a sender" do
    expect(convo.sender_id).to eq user.id
  end

  it "has a receiver" do
    expect(convo.recipient_id).to eq user2.id
  end

  it "has messages" do
    expect(convo.messages).to eq [msg1, msg2]
  end
  
end
