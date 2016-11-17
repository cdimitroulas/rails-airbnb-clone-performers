class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :content
      t.boolean :read, default: false
      t.references :user, foreign_key: true
      t.references :performer, foreign_key: true

      t.timestamps
    end
  end
end
