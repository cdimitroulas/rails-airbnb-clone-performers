class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :content
      t.references :booking, foreign_key: true
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
