class PerformersController < ApplicationController
  def index
    @performers = Performer.where.not(latitude: nil, longitude: nil)
    if params[:postcode].present?
      @performers = @performers.near(params[:postcode], 50)
    end
    if params[:category].present?
      @performers = @performers.where(category: params[:category])
    end
    if params[:event_types].present?
      @performers = @performers.where(event_types: params[:event_types])
    end
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

end






