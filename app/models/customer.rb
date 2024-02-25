class Customer < ApplicationRecord
  has_many :cart_items
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  GUEST_CUSTOMER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_CUSTOMER_EMAIL) do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.last_name = ""
      customer.first_name = ""
      customer.last_name_kana = "ゲストユーザー"
      customer.first_name_kana = "ゲストユーザー"
      customer.birthday = "19910819"
      customer.postal_code ="0000000"
      customer.address = "ゲストユーザー"
      customer.telephone_number = "ゲストユーザー"
    end
  end
  def full_name
    self.last_name+self.first_name
  end

end
