class PerformersController < ApplicationController
  def index
    @performers = Performer.where(nil)
    filtering_params(params).each do |key, value|
      @performers = @performers.public_send(key, value) if value.present?
    end
    # event_type, category, start_time, end_time, city
  end

  def show
    @performer = Performer.find(params[:id])
  end

  def edit
    @performer = Performer.find(params[:id])
    if current_performer.id == params[:id].to_i
      return
    else
      redirect_to performer_path(@performer)
    end
  end

  def update
    @performer = Performer.update(performer_params)
    redirect_to edit_performer_path(current_performer)
  end

  def dashboard
  end

  private

  def performer_params
    params.require(:performer).permit(:first_name, :last_name, :city, :description,
                                      :members, :category, :event_types, :requirements,
                                      :hourly_rate, :discount, :cancellation)
  end

  # A list of the param names that can be used for filtering the Product list
  def filtering_params(params)
    params.slice(:category, :city)
  end
end






