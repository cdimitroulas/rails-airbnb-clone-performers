class MessagesController < ApplicationController

  before_action :set_performer
  before_action :authenticate_user!

  def new
    @message = Message.new
    @performer = Performer.find(params[:performer_id])
  end

  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    @message.recipient = Performer.find(params[:performer_id])
    # @message = current_user.messages.build(message_params)
    if @message.save
      redirect_to user_path(current_user), notice: 'Message was successfully sent.'
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
    @message.read = true
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:subject, :content)
  end

  def set_performer
    @performer = Performer.find(params[:performer_id])
  end
end
