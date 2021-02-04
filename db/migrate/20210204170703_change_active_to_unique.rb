class ChangeActiveToUnique < ActiveRecord::Migration[6.1]
  def change
    change_column :menus, :active, :bool, unique: true
  end
end
