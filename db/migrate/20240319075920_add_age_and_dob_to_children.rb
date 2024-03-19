class AddAgeAndDobToChildren < ActiveRecord::Migration[7.0]
  def change
    add_column :children, :age, :integer
    add_column :children, :dob, :date
  end
end
