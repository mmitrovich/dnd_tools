class SpellBooksAndSpells < ActiveRecord::Migration[5.1]
  def up
  	create_table :spell_books_and_spells, :id => false do |t|
  		t.integer :spell_book_id, :null => false
  		t.integer :spell_id, :null => false
  	end

  	add_index :spell_books_and_spells, :spell_book_id
  	add_index :spell_books_and_spells, :spell_id
  end

  def down
  	drop_table :spell_books_and_spells
  end
end
