class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :grade, :integer
    add_column :users, :per_hour, :integer
  end
end
