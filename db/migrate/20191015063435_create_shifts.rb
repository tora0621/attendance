class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.time :starts_at, null: false
      t.time :expired_at, null: false
      t.time :break_starts_at
      t.time :break_expired_at

      t.timestamps
    end
  end
end
