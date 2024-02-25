class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = CartItem.all
    @sum = 0
    @order = Order.new(order_params)
    @order.postage = 500
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name
  end

  def create
    @order = Order.new(order_params)
    @order.postage = 500
    @order.customer = current_customer
    @order.save
    cart_items = current_customer.cart_items.all
    cart_items.each do |cart|
      OrderItem.create(order_id: @order.id, item_id: cart.item_id, price: cart.item.with_tax_price, amount: cart.amount)
    end
    cart_items.destroy_all
    redirect_to orders_complete_path
  end

 def complete
 end

 def index
   @orders = current_customer.orders.page(params[:page])
 end

 def show
   @order = Order.find(params[:id])
   @order_items = @order.order_items
   @sum = 0
   @order.postage = 500
 end

 private

 def order_params
   params.require(:order).permit(:address, :postal_code, :address, :name, :payment_method, :billing_amount)
 end
end
