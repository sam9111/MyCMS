class OwnerController < ApplicationController
  def index
    @users = User.all.reject { |user| user.role == "owner" }
    @menus = Menu.all
    render "index"
  end
end
