class PerformersController < ApplicationController
  def index
    @performers = Performer.all
    # event_type, category, start_time, end_time, city
  end

  def show
    @performer = Performer.find(params[:id])
  end

  def dashboard
  end
end
