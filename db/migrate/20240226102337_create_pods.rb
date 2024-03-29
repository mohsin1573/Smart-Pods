class CreatePods < ActiveRecord::Migration[7.0]
  def change
    create_table :pods do |t|
      t.string :title
      t.text :description
      t.string :location
      t.integer :grade
      t.integer :status, default: 0
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
