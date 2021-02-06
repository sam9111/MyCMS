class ChangeDateInOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :date, :datetime, precision: 6, null: false
  end
end
