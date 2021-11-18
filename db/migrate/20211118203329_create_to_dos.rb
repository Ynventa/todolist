class CreateToDos < ActiveRecord::Migration[6.1]
  def change
    create_table :to_dos do |t|
      t.string :title
      t.integer :task_id
      t.boolean :is_done

      t.timestamps
    end

    add_foreign_key "to_dos", "tasks", on_delete: :cascade
  end
end
