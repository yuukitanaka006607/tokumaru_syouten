# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]
  def after_sign_in_path_for(resouce)
    root_path
  end

  def after_sign_out_path_for(resouce)
    root_path
  end
  
  def guest_sign_in
    customer = Customer.guest
    sign_in(customer)
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました。"
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
private

  def customer_state
    customer = Customer.find_by(email: params[:customer][:email])
    if customer
      if customer.valid_password?(params[:customer][:password])&& customer.is_active==false
        redirect_to "/customers/sign_up"
      end
    end
  end
end