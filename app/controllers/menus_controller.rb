class MenusController < ApplicationController
  skip_before_action :ensure_user_is_owner, only: [:index, :show]

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
      flash[:error] = menu.errors.full_messages.join("\n")
    end
  end

  def show
    @is_owner = ensure_user_is_owner
    @current_menu_id = params[:id]
    @menu_items = MenuItem.where(menu_id: @current_menu_id)
    @menu = Menu.find(@current_menu_id)
    render "show"
  end

  def update
    active_status = params[:active]
    menu = Menu.find(params[:id])
    menu.active = active_status
    if menu.save
      redirect_to menu_path(:id => menu.id), notice: "#{menu.name.capitalize} menu was successfully set #{active_status}!"
    else
      flash[:error] = menu.errors.full_messages.join("\n")
    end
  end
end
