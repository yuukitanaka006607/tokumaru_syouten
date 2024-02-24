class AddTrackablToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :current_sign_in_ip, :string
    add_column :customers, :last_sign_in_ip, :string
    add_column :customers, :sign_in_count, :integer, null: false, default: 0
  end
end
