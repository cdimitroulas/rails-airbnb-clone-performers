class AddColumnsToPerformers < ActiveRecord::Migration[5.0]
  def change
    add_column :performers, :members, :integer
    add_column :performers, :requirements, :string
    add_column :performers, :discount, :integer
    add_column :performers, :cancellation_policy, :string
  end
end
