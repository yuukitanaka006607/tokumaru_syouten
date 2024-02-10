class Customer < ApplicationRecord
  has_many :cart_items
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    self.last_name+self.first_name
  end
  def after_database_authentication
    self.last_login_at = Time.current
    save
  end
end
