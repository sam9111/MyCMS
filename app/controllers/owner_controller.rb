class OwnerController < ApplicationController
  def index
    @users = User.all.reject { |user| user.role == "owner" }
    @menus = Menu.all
    @undelivered_orders = Order.where(delivered_at: nil)
    if !Menu.exists?(active: true)
      flash[:error] = "Set a menu to be active!"
    end
    render "index"
  end
end
