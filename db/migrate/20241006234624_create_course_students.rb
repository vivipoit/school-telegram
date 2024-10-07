class CreateCourseStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :course_students do |t|
      t.references :course, null: false, foreign_key: true
      t.references :student, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
