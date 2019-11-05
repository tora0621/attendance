class AddColumnWages < ActiveRecord::Migration[5.2]
  def change
    add_reference :wages, :shift, foreign_key: true
  end
end
