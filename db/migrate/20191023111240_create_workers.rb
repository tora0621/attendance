class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "first_name_kana"
      t.string "last_name_kana"
      t.string "tel"
      t.string "e_mail"
      t.string "post_number"
      t.string "address"
      t.string "birthday"
      t.string "classification"
      t.string "authority"
      t.string "hire_date"
      t.string "departure_date"
      t.string "affiliation"
      t.integer "status", default: 0
      t.timestamps
    end
  end
end
