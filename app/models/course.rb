# frozen_string_literal: true

class Course < ApplicationRecord
  self.implicit_order_column = 'created_at'

  # Utilizing a join table makes it available to store the grades in it
  has_many :courses_students, dependent: :destroy
  has_many :students, through: :courses_students

  validates :reference_code, format: { with: /\A[[:upper:]]{3}-[[:digit:]]{5}\Z/ }, uniqueness: true

  validates :name, :reference_code, presence: true

  # ::define_method could be used here to define similar methods
  # I prefer this version for readability

  def students_that_passed
    students_with_grades.merge(CoursesStudent.passed)
  end

  def students_that_failed
    students_with_grades.merge(CoursesStudent.failed)
  end

  private

  def students_with_grades
    Student.joins(:courses_students).where(courses_students: { course_id: id })
  end
end
