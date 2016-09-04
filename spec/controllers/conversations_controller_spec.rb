require 'rails_helper'

RSpec.describe ConversationsController, type: :controller do
  let(:user) { User.create!(username:"jay", email:"jay@gmail.com", password: "1234") }
  let(:user2) { User.create!(username:"jess", email:"jess@gmail.com", password: "password") }
  let(:user3) { User.create!(username:"Tj", email:"tj@gmail.com", password: "1234") }
  before(:each) do
    session[:user_id] = user.id
  end
  let!(:existing_convo) { Conversation.create(sender_id: user2.id, recipient_id: user3.id) }
  let!(:new_convo) { Conversation.new}
  let(:all_convos) {Conversation.all}
  let(:all_users) {User.all}


  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status 200
      # expect(response).to render_template(:index)
    end
  end

  describe "POST #create" do
    context "when starting a new conversation" do
      let :params do
        {sender_id: user.id, recipient_id: user2.id}
      end
      it "responds with status code 302" do
        expect{post(:create, params)}.to change(Conversation, :count).by(1)
        expect(response).to have_http_status 302
        expect(response).to redirect_to conversation_messages_path(all_convos.last)
      end
    end

    context "when a conversation exists already" do
      let :params do
        {sender_id: user3.id, recipient_id: user2.id}
      end
      it "responds with status code 302" do
        expect{post(:create, params)}.to change(Conversation, :count).by(0)
        expect(response).to have_http_status 302
        expect(response).to redirect_to conversation_messages_path(existing_convo.id)
      end
    end
  end


end
