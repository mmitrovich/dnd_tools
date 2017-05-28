class CreateInscriptions < ActiveRecord::Migration[5.1]
  def up
    create_table :inscriptions do |t|

      t.timestamps
    end
  end

  def down
  	drop_table :inscriptions
  end
end
