class OrderItemsController < ApplicationController
  skip_before_action :ensure_user_is_owner
end
