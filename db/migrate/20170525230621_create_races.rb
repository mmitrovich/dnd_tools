class CreateRaces < ActiveRecord::Migration[5.1]
  def up
    create_table :races do |t|
      t.string :name

      t.timestamps
    end
    add_index("races", "name")
  end

  def down
  	drop_table :races
  end
end
