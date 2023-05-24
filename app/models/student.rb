# frozen_string_literal: true

class Student < ApplicationRecord
  self.implicit_order_column = 'created_at'

  has_many :courses_students, dependent: :destroy
  has_many :courses, through: :courses_students

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  before_save -> { email.downcase! }

  def passed_courses
    courses_with_grades.merge(CoursesStudent.passed)
  end

  def failed_courses
    courses_with_grades.merge(CoursesStudent.failed)
  end

  def average_grade
    courses_students.pick('avg(grade)')
  end

  private

  def courses_with_grades
    Course.joins(:courses_students).where(courses_students: { student_id: id })
  end
end
