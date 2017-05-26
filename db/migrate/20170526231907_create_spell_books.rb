class CreateSpellBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :spell_books do |t|
      t.string :name
      t.string :description
      t.integer :player_id

      t.timestamps
    end
  end
end
