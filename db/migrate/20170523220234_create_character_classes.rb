class CreateCharacterClasses < ActiveRecord::Migration[5.1]
  def up
    create_table :character_classes do |t|
      t.string :name

      t.timestamps
    end

    add_index("character_classes", "name")
  end

  def down
  	drop_table :character_classes
  end
end
