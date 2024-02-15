class Admin::OrdersController < ApplicationController
   before_action :authenticate_admin!

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