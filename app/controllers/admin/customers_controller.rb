class Admin::CustomersController < ApplicationController
   before_action :authenticate_admin!

   def index
     @customers = Customer.all
   end

   def safety
     @customers = Customer.where('last_sign_in_at < ?', 3.days.ago)
   end

   def show
     @customer = Customer.find(params[:id])
   end

   def edit
     @customer = Customer.find(params[:id])
   end

   def update
     @customer = Customer.find(params[:id])
     @customer.update(customer_params)
     redirect_to admin_customer_path(@customer.id)
   end

   private

   def customer_params
   params.require(:customer).permit(:id, :last_name, :first_name, :first_name_kana, :last_name_kana, :email, :postal_code, :address, :telephone_number, :is_active, :current_sign_in_at, :birthday)
   end
end