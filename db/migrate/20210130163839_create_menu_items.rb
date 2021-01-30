class CreateMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.belongs_to :menu, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.decimal :price

      t.timestamps
    end
  end
end
