class MenusController < ApplicationController
  def index
    @menus = Menu.all
    render "index"
  end

  def create
    name = params[:name]
    menu = Menu.new(name: name)
    if menu.save
      flash[:notice] = "#{name} menu was successfully created!"
    else
      flash[:error] = menu.errors.full_messages.join("\n")
    end
    render "index"
  end

  def show
    @current_menu_id = params[:id]
    @menu_items = MenuItem.where(menu_id: @current_menu_id)
  end
end
