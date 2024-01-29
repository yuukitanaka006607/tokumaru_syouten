class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end


 private

    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :birthday, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
    end
end