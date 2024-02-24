class RemoveLastLoginAtFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :last_login_at, :datetime
  end
end
