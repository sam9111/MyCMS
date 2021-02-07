class CustomerController < ApplicationController
  skip_before_action :ensure_user_is_owner

  def index
    @active_menu = Menu.find_by(active: true)
    if @active_menu
      @menu_items = MenuItem.where(menu_id: @active_menu.id, deletable: nil)
    end
    render "index"
  end
end
