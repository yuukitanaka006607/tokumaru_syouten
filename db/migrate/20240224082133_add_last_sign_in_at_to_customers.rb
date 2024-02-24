class AddLastSignInAtToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :last_sign_in_at, :datetime
  end
end
