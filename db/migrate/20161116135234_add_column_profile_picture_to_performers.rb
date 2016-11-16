class AddColumnProfilePictureToPerformers < ActiveRecord::Migration[5.0]
  def change
    add_column :performers, :profile_picture, :string
  end
end
