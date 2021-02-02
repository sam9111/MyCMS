class MenuItemsController < ApplicationController
  def new
  end

  def create
    name = params[:name]
    menu_id = params[:menu_id]
    menuItem = MenuItem.new(name: name, menu_id: menu_id)
    if menuItem.save
      redirect_to menu_path(:id => menu_id), notice: "#{name} item was successfully created!"
    else
      flash[:error] = menuItem.errors.full_messages.join("\n")
    end
  end
end
