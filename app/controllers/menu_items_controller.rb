class MenuItemsController < ApplicationController
  skip_before_action :ensure_user_is_owner, only: [:index, :show]

  def new
    @current_menu_id = params[:menu_id]
    @menu = Menu.find(@current_menu_id).name.capitalize
  end

  def show
    menuItem_id = params[:id]
  end

  def create
    name = params[:name].capitalize
    description = params[:description].capitalize
    price = params[:price]
    menu_id = params[:menu_id]
    menuItem = MenuItem.new(name: name, menu_id: menu_id, description: description, price: price)
    if menuItem.save
      redirect_to menu_path(:id => menu_id), notice: "#{name} item was successfully created!"
    else
      flash[:error] = menuItem.errors.full_messages.join(", ")
      redirect_to new_menu_item_path(menu_id: menu_id)
    end
  end

  def destroy
    menu_id = params[:menu_id]
    item = MenuItem.find(params[:id])
    name = item.name.capitalize
    item.destroy

    redirect_to menu_path(:id => menu_id), notice: "#{name} item was successfully deleted!"
  end
end
