class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def subtotal
    item.with_tax_price * amount
  end

  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/image/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default_image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end
end
