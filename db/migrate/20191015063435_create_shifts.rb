class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.time :starts_at
      t.time :expired_at
      t.time :break_starts_at
      t.time :break_expired_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
