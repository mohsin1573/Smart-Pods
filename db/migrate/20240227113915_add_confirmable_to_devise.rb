class AddConfirmableToDevise < ActiveRecord::Migration[7.0]
  def up
    add_column :parents, :confirmation_token, :string
    add_column :parents, :confirmed_at, :datetime
    add_column :parents, :confirmation_sent_at, :datetime
    add_column :parents, :unconfirmed_email, :string
    add_index :parents, :confirmation_token, unique: true
  end

  def down
    remove_index :parents, :confirmation_token
    remove_columns :parents, :confirmation_token, :confirmed_at, :confirmation_sent_at
    remove_columns :parents, :unconfirmed_email
  end
end
