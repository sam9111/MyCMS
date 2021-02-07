class AddDeletableColumnToMenuItems < ActiveRecord::Migration[6.1]
  def change
    add_column :menu_items, :deletable, :bool
  end
end
