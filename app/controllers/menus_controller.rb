class MenusController < ApplicationController
  def index
    @menus = Menu.all

    render "index"
  end

  def create
    name = params[:name].capitalize
    menu = Menu.new(name: name)
    if menu.save
      redirect_to owner_path, notice: "#{name} menu was successfully created!"
    else
      flash[:error] = menu.errors.full_messages.join(", ")
      redirect_to new_menu_path
    end
  end

  def show
    @is_owner = ensure_user_is_owner
    @current_menu_id = params[:id]
    @menu_items = MenuItem.where(menu_id: @current_menu_id)
    @menu = Menu.find(@current_menu_id)
  end

  def update
    active_status = params[:active]
    menu = Menu.find(params[:id])
    if active_status
      if Menu.where(active: true).any?
        flash[:error] = "#{Menu.find_by(active: true).name} menu is already active!"
        redirect_to menu_path(params[:id]) and return
      end
      if !MenuItem.where(menu_id: menu.id).any?
        flash[:error] = "#{menu.name} menu is empty! Cannot set it active!"
        redirect_to menu_path(params[:id]) and return
      end
    end
    menu.active = active_status
    menu.save
    redirect_to menu_path(:id => menu.id), notice: "#{menu.name.capitalize} menu was successfully set #{active_status ? true : false}!"
  end
end
