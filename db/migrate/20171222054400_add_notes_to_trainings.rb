class AddNotesToTrainings < ActiveRecord::Migration[5.1]
  def up
    add_column :trainings, :notes, :text
  end

  def down
  	remove_column :trainings, :notes
  end
end
