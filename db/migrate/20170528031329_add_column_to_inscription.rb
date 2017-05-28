class AddColumnToInscription < ActiveRecord::Migration[5.1]
  def up
  	add_column :inscriptions, :spell_id, :integer
  	add_column :inscriptions, :spell_book_id, :integer
  	add_index :inscriptions, "spell_book_id"
  	add_index :inscriptions, "spell_id"
  end

  def down
  	drop_index :inscriptions, :spell_id
  	drop_index :inscriptions, :spell_book_id
  	drop_column :inscriptions, :spell_book_id
  	drop_column :inscriptions, :spell_id
  end

end
