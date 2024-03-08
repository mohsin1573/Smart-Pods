class AddDetailsToTeachers < ActiveRecord::Migration[7.0]
  def change
    add_column :teachers, :phone_number, :string
    add_column :teachers, :education, :string
    add_column :teachers, :grade, :integer
  end
end
