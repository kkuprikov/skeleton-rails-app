# frozen_string_literal: true

class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :email

      t.timestamps
    end

    add_index :students, :email, unique: true
  end
end
