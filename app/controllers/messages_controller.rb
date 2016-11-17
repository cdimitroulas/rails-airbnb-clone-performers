class MessagesController < ApplicationController

  def new
    @message = Message.new(message_params)
  end

  def create
    @message = current_user.bookings.build(message_params)
    @message.performer_id = params[:performer_id]

    if @message.save
      redirect_to @message, notice: 'Message was successfully created.'
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
    @message.read = true
  end

  private

  def message_params
    params.require(:booking).permit(:subject, :content, :read)
  end
end
