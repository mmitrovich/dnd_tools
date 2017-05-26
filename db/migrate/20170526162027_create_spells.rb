class CreateSpells < ActiveRecord::Migration[5.1]
  def up
    create_table :spells do |t|
      t.string :name
      t.integer :level
      t.string :school
      t.string :casting_time
      t.string :range
      t.string :components
      t.string :duration
      t.text :description

      t.timestamps
    end
  end

  def down
    drop_table :spells
  end
end
