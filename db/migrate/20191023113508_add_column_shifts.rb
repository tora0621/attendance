class AddColumnShifts < ActiveRecord::Migration[5.2]
  def change
    add_reference :shifts, :worker, foreign_key: true
  end
end
