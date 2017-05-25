class ChangeCharacterClassNameToId < ActiveRecord::Migration[5.1]
  
  def up
  	rename_column :characters, :character_class, :character_class_id
  	change_column :characters, :character_class_id, :integer
  	add_index :characters, :character_class_id
  end

  def down
  	remove_index :characters, :character_class_id
  	change_column :characters, :character_class_id, :string
  	rename_column :characters, :character_class_id, :character_class
  end
 
end
