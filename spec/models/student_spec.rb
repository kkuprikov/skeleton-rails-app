# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student do
  subject(:student) do
    described_class.new(first_name: 'Tom', last_name: 'Fowler', middle_name: 'Walter', email: 'tom@test.com')
  end

  it 'is valid with valid attributes' do
    expect(student).to be_valid
  end

  it 'is valid without a middle name' do
    student.middle_name = nil
    expect(student).to be_valid
  end

  %i[first_name last_name email].each do |field|
    it "is invalid without #{field}" do
      student.public_send("#{field}=", nil)
      expect(student).not_to be_valid
    end
  end

  it 'is invalid with existing email' do
    described_class.create!(**student.attributes)
    expect(student).not_to be_valid
    expect(student.errors.messages).to include(email: ['has already been taken'])
  end

  describe 'instance methods' do
    subject(:student) { described_class.create(first_name: 'Tom', last_name: 'Fowler', middle_name: 'Walter', email: 'tom@test.com') }

    let!(:passed_course) do
      passed_course = Course.create!(name: 'Passed', reference_code: 'ABC-12321')
      CoursesStudent.create!(course_id: passed_course.id, student_id: student.id, grade: 100)
      passed_course
    end

    let!(:failed_course) do
      failed_course = Course.create!(name: 'Failed', reference_code: 'ABD-12321')
      CoursesStudent.create!(course_id: failed_course.id, student_id: student.id, grade: 20)
      failed_course
    end

    specify do
      expect(student.passed_courses).to contain_exactly(passed_course)
      expect(student.failed_courses).to contain_exactly(failed_course)
    end

    specify { expect(student.average_grade).to eq(60) }
  end
end
