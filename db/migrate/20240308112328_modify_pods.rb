class ModifyPods < ActiveRecord::Migration[7.0]
  def change
    remove_column :pods, :description
    remove_column :pods, :location
    rename_column :pods, :title, :name
    add_column :pods, :phone_number, :string
  end
end
