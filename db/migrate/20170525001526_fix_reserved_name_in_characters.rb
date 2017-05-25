class FixReservedNameInCharacters < ActiveRecord::Migration[5.1]
  def up
  	rename_column :characters, :class, :character_class
  end

  def down
  	rename_column :characters, :character_class, :class
  end
end
