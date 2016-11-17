class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :content
      t.boolean :sent_by_user, default: true
      t.boolean :read, default: false
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
