class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :title
      t.text :description
      t.references :user, foreign_key: true
      t.references :performer, foreign_key: true

      t.timestamps
    end
  end
end
