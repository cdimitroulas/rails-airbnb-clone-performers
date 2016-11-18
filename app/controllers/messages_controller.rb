class MessagesController < ApplicationController

  #before_action :set_message

  def new
    @message = Message.new
      if current_user
        @message = current_user.messages_sent.build
        @performer = Performer.find(params[:performer_id])
      else
        @message = current_performer.messages_sent.build
        @performer = Performer.find(params[:performer_id])
    end
  end

  def create
    @message = Message.new(message_params)
    if current_user
      @message = current_user.messages_sent.build(message_params)
      @message.recipient = Performer.find(params[:performer_id])
      if @message.save
        redirect_to user_path(current_user), notice: 'Message was successfully sent.'
      else
        render :new
      end
    elsif current_performer
      @message = current_performer.messages_sent.build(message_params)
      @message.recipient = User.find(params[:user_id])
      if @message.save
        redirect_to dashboard_path, notice: 'Message was successfully sent.'
      else
        render :new
      end
    end
  end

  # def new_message_performer
    # @message = Message.new
   #
  # end
#
  # def create_message_performer
    # @message = Message.new(message_params)
    # @message.sender = current_performer
    # @message.recipient = User.find(params[:user_id]
    # if @message.save
      # redirect_to performer_path(current_performer), notice: 'Message was successfully sent.'
    # else
      # render :new
    # end
  # end


  def show
    if current_user
      @message = Message.find(params[:id])
      @message.read = true
      @message.save
      @performer = @message.sender
      render "show_message"
    else
      @message = Message.find(params[:id])
      @message.read = true
      @message.save
      @user = @message.sender
    end
  end

  private

  def message_params
    params.require(:message).permit(:subject, :content)
  end

  def set_message
    #@message = Message.find(params[:id])
  end
end
