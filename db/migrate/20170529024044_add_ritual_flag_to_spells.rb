class AddRitualFlagToSpells < ActiveRecord::Migration[5.1]
  def up
  	add_column :spells, :ritual, :boolean
  end

  def down
  	drop_column :spells, :ritual, :default => 0
  end
end
