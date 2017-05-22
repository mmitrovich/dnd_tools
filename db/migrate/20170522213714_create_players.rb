class CreatePlayers < ActiveRecord::Migration[5.1]
  def up
    create_table :players do |t|
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end

  def down
  	drop_table :players
  end
end
