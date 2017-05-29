class CreateFeats < ActiveRecord::Migration[5.1]
  def up
    create_table :feats do |t|
      t.string :name
      t.string :type
      t.text :description
      t.string :uses, :default => 'N\A'
      t.string :reset, :default => 'N\A'

      t.timestamps
    end
  end

  def down
    drop_table :feats
  end
end
