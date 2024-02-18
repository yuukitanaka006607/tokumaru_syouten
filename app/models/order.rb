class Order < ApplicationRecord
  enum payment_method: { cash: 0, credit_card: 1 }
  enum status: { started_yet: 0, shipping: 1, complete: 2 }
  belongs_to :customer
  has_many :order_items
  has_many :items, through: :order_items

  def self.status_options
    
    statuses.map { |k, _| [human_attribute_enum_value(:status, k), k] }.to_h
  end

  def self.human_attribute_enum_value(attr_name, value)

    I18n.t("enums.#{model_name.i18n_key}.#{attr_name}.#{value}")
  end


end
