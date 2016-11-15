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
  end

  def dashboard
  end

  private

  # A list of the param names that can be used for filtering the Product list
  def filtering_params(params)
    params.slice(:category, :city)
  end
end






