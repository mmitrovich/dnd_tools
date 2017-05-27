class CreateInscriptions < ActiveRecord::Migration[5.1]
  def up
    create_table :inscriptions do |t|
      t.integer :spell_id
      t.integer :spell_book_id
      t.integer :uses

      t.timestamps
    end

    add_index :inscriptions, "spell_id"
    add_index :inscriptions, "spell_book_id"
  end


  def down
  	drop_table :inscriptions
  end
end
