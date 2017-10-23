class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :owner, null: false
      t.boolean :public_viewable, default: false        # Defaults to private
      t.string :name, null: false

      t.timestamps
    end
  end
end
