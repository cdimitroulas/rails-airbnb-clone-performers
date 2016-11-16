class AddColumnProfilePictureToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :profile_picture, :string, default: 'http://res.cloudinary.com/dplnt2ozo/image/upload/v1479313226/Airbnb-clone/iStock_000033523696Small.jpg'
  end
end
