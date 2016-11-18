class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :delete]

  def new
    @booking = Booking.new
  end

  def create

    @booking = current_user.bookings.build(booking_params)
    @booking.performer_id = params[:performer_id]
    # @price = @performer.hourly_rate * number_of_hours

    if @booking.save
      redirect_to performer_booking_path(id: @booking.id), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def delete
    @booking.destroy
    redirect_to user, notice: 'Booking was successfully cancelled.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :location, :message)
  end
end
