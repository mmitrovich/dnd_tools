class CreateCharacters < ActiveRecord::Migration[5.1]
  def up
    create_table :characters do |t|
      t.string :name
      t.string :race
      t.string :class
      t.integer :level
      t.integer :player_id

      t.timestamps
    end

    add_index('characters', 'player_id')
  end


  def down
  	drop_table :characters
  end
end
