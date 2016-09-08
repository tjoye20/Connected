class ConversationsController < ApplicationController
  # before_action :authenticate_user

  def index
    @user = User.find(1)
    conversation_hash = {conversations: []}
    @conversations = Conversation.where(sender_id: @user)
    @conversations.each do |conversation|
      conversation_hash[:conversations] << conversation.recipient
    end
    render json: conversation_hash
  end

  def show
    p params
    @conversation = Conversation.find(params[:id])
    # @conversation = Conversation.find_by(sender_id: params["sender_id"], recipient_id: params["recipient_id"])
    puts "---------------------------------------------------------- "
    puts "@conversation is:"
    p @conversation
    @messages = @conversation.messages
    puts "---------------------------------------------------------- "
    puts "@messages is:"
    p @messages
    render json: @messages
  end

  def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    Message.create(conversation_id: @conversation.id, body: params[:message], user_id: params[:sender_id], read: true)
    render json: @conversation
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
