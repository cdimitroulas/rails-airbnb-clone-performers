class PerformersController < ApplicationController
  before_action :set_performer, only: [:show, :edit, :update]

  def index
    @performers = Performer.search_filter(params)

    @markers = Gmaps4rails.build_markers(@performers) do |performer, marker|
      marker.lat performer.latitude
      marker.lng performer.longitude
    end
  end

  def show
    @markers = Gmaps4rails.build_markers(@performer) do |performer, marker|
      marker.lat performer.latitude
      marker.lng performer.longitude
    end
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






