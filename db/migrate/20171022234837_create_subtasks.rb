class CreateSubtasks < ActiveRecord::Migration[5.1]
  def change
    create_table :subtasks do |t|
      t.references :tasks, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
