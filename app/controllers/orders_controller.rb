class OrdersController < ApplicationController
  skip_before_action :ensure_user_is_owner

  def index
    @is_customer = customer
    @is_owner = owner
    @orders = Order.all
    @orders_customer = Order.where(user_id: session[:current_user_id])
  end

  def new
    total = params[:total]
    new_order = Order.new(date: DateTime.now, user_id: session[:current_user_id], total: total)
    if new_order.save
      cart = session[:cart]
      cart.each do |item|
        quantity = item["quantity"]
        menu_item_id = item["menu_item_id"]
        menu_item = MenuItem.find(menu_item_id)
        new_order_item = OrderItem.new(order_id: new_order.id,
                                       menu_item_id: menu_item_id, quantity: quantity, menu_item_name: menu_item.name, menu_item_price: menu_item.price)
        new_order_item.save
      end
      session[:cart] = []
      redirect_to order_path(id: new_order.id), notice: "Order was successfully created.Thank you for placing an order with us!"
    else
      flash[:error] = new_order.errors.full_messages.join(", ")
      redirect_to cart_path
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
  end
end
