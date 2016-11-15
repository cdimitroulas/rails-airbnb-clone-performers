class PerformersController < ApplicationController
  def index
    @perfomers = Performer.all
    # event_type, category, start_time, end_time, city
  end

  def show
    @perfomer = Perfomer.find(params[:id])
  end
end
