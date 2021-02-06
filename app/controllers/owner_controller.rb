class OwnerController < ApplicationController
  def index
    @users = User.all.reject { |user| user.role == "owner" }
    @menus = Menu.all
    if !Menu.exists?(active: true)
      flash[:error] = "Set a menu to be active!"
    end
    render "index"
  end
end
