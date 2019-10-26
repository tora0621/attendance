class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.datetime :rest_start_at
      t.datetime :rest_end_at

      t.timestamps
    end
  end
end
