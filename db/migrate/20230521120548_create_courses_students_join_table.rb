# frozen_string_literal: true

class CreateCoursesStudentsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :courses_students, id: false do |t|
      t.uuid :course_id, null: false
      t.uuid :student_id, null: false
      t.integer :grade, null: false
    end

    add_index :courses_students, :course_id
    add_index :courses_students, :student_id
  end
end
