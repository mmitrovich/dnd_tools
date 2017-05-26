class CreateSpellBooks < ActiveRecord::Migration[5.1]
  def up
    create_table :spell_books do |t|
      t.string :name
      t.string :description
      t.integer :character_id

      t.timestamps
    end

    add_index :spell_books, :character_id
  end

  def down
  	drop_table :spell_books
  end
end
