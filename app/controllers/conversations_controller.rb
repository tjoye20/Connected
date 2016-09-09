class ConversationsController < ApplicationController
  # before_action :authenticate_user

  def index
    @user = User.find(session[:user_id])
    conversation_hash = {conversations: []}
    @conversations = Conversation.where(sender_id: @user.id)
    @conversations.each do |conversation|
      conversation_hash[:conversations] << conversation.recipient
    end

    render json: conversation_hash
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages
    render json: @messages
  end

  def find
    @user = User.find(params[:user_id])
    @recipient = User.find(params[:recipient_id])
    if Conversation.between(@user, @recipient).first
      @conversation = Conversation.between(@user, @recipient).first
    else
      @conversation = Conversation.create(sender_id: @user.id, recipient_id: @recipient.id)
    end

    render json: @conversation.messages
  end

  def create
    @user = User.find(params[:sender_id])
    @recipient = User.find(params[:recipient_id])
    @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first

    Message.create(conversation_id: @conversation.id, body: params[:message], user_id: params[:sender_id], read: true)

    render json: @conversation
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
