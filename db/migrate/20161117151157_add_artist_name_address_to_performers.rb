class AddArtistNameAddressToPerformers < ActiveRecord::Migration[5.0]
  def change
    add_column :performers, :artist_name, :string
    add_column :performers, :address, :string
  end
end
