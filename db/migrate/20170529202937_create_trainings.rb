class CreateTrainings < ActiveRecord::Migration[5.1]
  def up
    create_table :trainings do |t|
      t.integer :character_id
      t.integer :feat_id
      t.integer :custom_uses_count

      t.timestamps
    end

    add_index :trainings, :character_id
    add_index :trainings, :feat_id
  end

  def down
  	drop_table :trainings
  end
end
