class AddCoordinatesToPerformers < ActiveRecord::Migration[5.0]
  def change
    add_column :performers, :latitude, :float
    add_column :performers, :longitude, :float
  end
end
