class Admin::OrdersController < ApplicationController
   before_action :authenticate_admin!

   def show
     @order = Order.find(params[:id])
     @order_items = @order.order_items
     @sum = 0
     @order.postage = 500
   end

   def update
     @order = Order.find(params[:id])
     @order.update(order_params)
     redirect_to admin_order_path(@order)
   end

  private

  def order_params
    params.require(:order).permit(:address, :postal_code, :address, :name, :payment_method, :billing_amount, :status)
  end
end