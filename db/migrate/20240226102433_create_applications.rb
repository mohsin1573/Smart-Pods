class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.references :parent, null: false, foreign_key: true
      t.references :child, null: false, foreign_key: true
      t.references :pod, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
