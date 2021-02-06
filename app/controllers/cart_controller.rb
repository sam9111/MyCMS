class CartController < ApplicationController
  skip_before_action :ensure_user_is_owner

  def index
    @cart = session[:cart]
    @total = 0
    if @cart
      @cart.each do |cartItem|
        price = MenuItem.find(cartItem["menu_item_id"]).price
        @total += price * cartItem["quantity"]
      end
    end
  end

  def update
    menu_item_id = params[:id]
    quantity = params[:quantity].to_i
    if quantity < 1
      flash[:error] = "Please add atleast one item!"
      redirect_to menu_item_path(menu_item_id) and return
    end
    if session[:cart].any? { |item| item["menu_item_id"] == menu_item_id }
      session[:cart].map { |item| item["quantity"] += quantity if item["menu_item_id"] == menu_item_id }

      redirect_to cart_path, notice: "Added #{quantity} more of #{MenuItem.find(menu_item_id).name} to cart!"
    else
      session[:cart].push({ "menu_item_id" => menu_item_id, "quantity" => quantity.to_i })
      redirect_to cart_path, notice: "Added #{MenuItem.find(menu_item_id).name} to cart!"
    end
  end

  def delete_item
    menu_item_id = params[:id]
    session[:cart].reject! { |item| item["menu_item_id"] == menu_item_id }
    redirect_to cart_path, notice: "Deleted  #{MenuItem.find(menu_item_id).name} from cart!"
  end
end
