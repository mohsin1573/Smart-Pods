class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street1
      t.string :city
      t.string :state
      t.string :zipcode
      t.references :pod, null: false, foreign_key: true

      t.timestamps
    end
  end
end
