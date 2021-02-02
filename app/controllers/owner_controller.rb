class OwnerController < ApplicationController
  before_action :ensure_user_is_owner

  def index
    @users = User.all.reject { |user| user.role == "owner" }
    @menus = Menu.all
  end

  def ensure_user_is_owner
    unless User.find(session[:current_user_id]).role == "owner"
      redirect_to menus_path
    end
  end
end
