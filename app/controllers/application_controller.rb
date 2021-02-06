class ApplicationController < ActionController::Base
  before_action :ensure_user_is_owner
  before_action :ensure_user_logged_in

  def current_user
    return @current_user if @current_user
    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user = User.find(current_user_id)
    else
      nil
    end
  end

  def ensure_user_is_owner
    if User.find(session[:current_user_id]).role != "owner"
      redirect_to customer_path
    else
      return true
    end
  end

  def customer
    return true if User.find(session[:current_user_id]).role == "customer"
  end

  def ensure_user_logged_in
    unless current_user
      redirect_to root_path
    end
  end
end
