class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.string :subject
      t.references :teacher, foreign_key: { to_table: :users }, null: false
      t.references :teacher_assistant, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
