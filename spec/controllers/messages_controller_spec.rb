require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let!(:user) { User.create!(username:"jay", email:"jay@gmail.com", password: "1234") }
  let!(:user2) { User.create!(username:"jess", email:"jess@gmail.com", password: "password") }
  let!(:convo) { Conversation.create(sender_id: user.id, recipient_id: user2.id) }
  let(:message) { Message.create!(conversation_id: convo.id, body: "Hey, wassup?", user_id: user.id, read: true) }
  let!(:new_message) { Conversation.find(convo.id).messages.create!(conversation_id: convo.id, body: "Hey T, wassup?", user_id: user2.id)}
  let!(:all_messages) { Conversation.find(convo.id).messages }

    describe "GET #index" do
      before(:each) do
        session[:user_id] = user2.id
      end
      let :params do
        {conversation_id: convo.id}
      end
      it "responds with status code 200" do
        get :index, params
        expect(response).to be_success
        expect(response).to have_http_status 200
        #not sure if I'm writing this write, below.
        # expect(assigns(:all_messages)).to eq [new_message, message]
        expect(response).to render_template(:index)
      end
    end

    describe "GET #new" do
      it "responds with status code 200" do
        get :new, conversation_id: convo.id
        expect(response).to be_success
        expect(assigns(:message)).to be_a_new Message
        expect(response).to have_http_status 200
        expect(response).to render_template(:new)
      end
    end

    describe "POST #create" do
      context "when valid params are passed" do
        it "responds with status code 302" do
          expect{post :create, conversation_id: convo.id, message: {body: "Hey, wassup?", user_id: user.id}}.to change(Message, :count).by(1)
          expect(assigns(:message)).to eq(Message.last)
          expect(response).to have_http_status 302
          expect(response).to redirect_to conversation_messages_path(convo)
        end
      end
    end
end
