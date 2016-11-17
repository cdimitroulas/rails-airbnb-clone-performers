class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :content
      t.boolean :read, default: false
      t.references :sender, polymorphic: true, index: true
      t.references :recipient, polymorphic: true, index: true

      t.timestamps
    end
  end
end
