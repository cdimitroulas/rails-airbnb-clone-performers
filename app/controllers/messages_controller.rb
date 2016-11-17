class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = current_user.bookings.messages.build(message_params)
    @message.performer_id = params[:performer_id]

    if @message.save
      redirect_to @message, notice: 'Message was successfully sent.'
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
    params.require(:booking).permit(:subject, :content, :read)
  end
end
