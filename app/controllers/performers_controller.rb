class PerformersController < ApplicationController
  before_action :set_performer, only: [:show, :edit, :update]

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

    @markers = Gmaps4rails.build_markers(@performers) do |performer, marker|
      marker.lat performer.latitude
      marker.lng performer.longitude
    end
  end

  def show

  end

  def edit

    if current_performer.id == params[:id].to_i
      return
    else
      redirect_to performer_path(@performer)
    end
  end

  def update
    @performer.update(performer_params)
    redirect_to edit_performer_path(current_performer)
  end

  def dashboard
  end

  private

  def performer_params
    params.require(:performer).permit(:first_name, :last_name, :city,
                                      :members, :category, { event_types: [] }, :requirements,
                                      :hourly_rate, :discount, :cancellation_policy, :profile,
                                      :profile_picture, :profile_picture_cache, :picture,
                                      :picture_cache, :artist_name, :address, :phone_number)
  end

  def set_performer
    @performer = Performer.find(params[:id])
  end

end






