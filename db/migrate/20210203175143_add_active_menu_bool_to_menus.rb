class AddActiveMenuBoolToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :active, :bool
  end
end
