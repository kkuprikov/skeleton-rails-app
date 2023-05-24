# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses, id: :uuid do |t|
      t.string :name, null: false
      t.string :reference_code, null: false
      t.text :description

      t.timestamps
    end

    add_index :courses, :reference_code, unique: true
  end
end
