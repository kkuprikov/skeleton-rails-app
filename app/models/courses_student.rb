# frozen_string_literal: true

class CoursesStudent < ApplicationRecord
  PASS_THRESHOLD = Rails.application.config.pass_threshold || 80
  public_constant :PASS_THRESHOLD

  belongs_to :course
  belongs_to :student

  # By using scopes here we avoid some duplicating in other models
  scope :passed, -> { where('courses_students.grade >= ?', PASS_THRESHOLD) }
  scope :failed, -> { where('courses_students.grade < ?', PASS_THRESHOLD) }
end
