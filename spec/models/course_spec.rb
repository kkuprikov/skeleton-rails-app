# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Course do
  subject(:course) do
    described_class.new(name: 'Test', reference_code: 'ABC-12321')
  end

  it 'is valid with valid attributes' do
    expect(course).to be_valid
  end

  it 'is invalid without a name' do
    course.name = nil
    expect(course).not_to be_valid
  end

  it 'is invalid without a ref code' do
    course.reference_code = nil
    expect(course).not_to be_valid
  end

  it 'is invalid with the ref code in a wrong format' do
    course.reference_code = '123'
    expect(course).not_to be_valid
  end

  it 'is invalid with existing ref code' do
    described_class.create!(name: 'Test', reference_code: 'ABC-12321')
    expect(course).not_to be_valid
    expect(course.errors.messages).to include(reference_code: ['has already been taken'])
  end

  describe '.students*' do
    subject(:course) do
      described_class.create(name: 'Test', reference_code: 'ABC-12321')
    end

    let!(:passed_student) do
      passed_student = Student.create!(first_name: 'Tom', last_name: 'Fowler', email: 'tom@test.com')
      CoursesStudent.create!(course_id: course.id, student_id: passed_student.id, grade: 80)
      passed_student
    end

    let!(:failed_student) do
      failed_student = Student.create!(first_name: 'Bob', last_name: 'Ford', email: 'bob@test.com')
      CoursesStudent.create!(course_id: course.id, student_id: failed_student.id, grade: 79)
      failed_student
    end

    specify do
      expect(course.students_that_passed).to contain_exactly(passed_student)
      expect(course.students_that_failed).to contain_exactly(failed_student)
    end
  end
end
