class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :number, null: false
      t.string :title, null: false
      t.string :status, null: false
      t.string :priority, null: false
      t.string :assignee
      t.text :description
      t.text :description_rich_text
      t.datetime :due_date
      t.datetime :deleted_at

      t.timestamps 
    end
  end
end