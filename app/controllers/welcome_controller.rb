class WelcomeController < ApplicationController
  skip_before_action :ensure_user_logged_in
  skip_before_action :ensure_user_is_owner

  def index
    if current_user
      user = current_user
      if user.role == "customer"
        redirect_to customer_path
      elsif user.role == "owner"
        redirect_to owner_path
      end
    else
      render "index"
    end
  end
end
