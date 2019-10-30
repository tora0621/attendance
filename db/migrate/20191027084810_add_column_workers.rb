class AddColumnWorkers < ActiveRecord::Migration[5.2]
  def change
    add_column :workers, :per_hour, :integer
  end
end
