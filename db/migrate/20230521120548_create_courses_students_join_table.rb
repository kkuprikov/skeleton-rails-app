# frozen_string_literal: true

class CreateCoursesStudentsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :courses_students, id: false do |t|
      t.uuid :course_id, null: false
      t.uuid :student_id, null: false
      t.integer :grade, null: false
    end

    add_index :courses_students, %i[course_id student_id], unique: true
    add_index :courses_students, :student_id
  end
end
