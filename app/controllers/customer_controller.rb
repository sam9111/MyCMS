class CustomerController < ApplicationController
  def index
    @active_menu = Menu.find_by(active: true)

    @menu_items = MenuItem.where(menu_id: @active_menu.id)

    render "index"
  end
end
