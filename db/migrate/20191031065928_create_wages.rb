class CreateWages < ActiveRecord::Migration[5.2]
  def change
    create_table :wages do |t|
      t.references :worker, foreign_key: true
      t.integer :base, default: 0, null: false
      t.integer :long, default: 0, null: false
      t.integer :night, default: 0, null: false
      t.integer :total, default: 0, null: false
      t.integer :meals, default: 0, null: false
      t.integer :other, default: 0, null: false


      t.timestamps
    end
  end
end
