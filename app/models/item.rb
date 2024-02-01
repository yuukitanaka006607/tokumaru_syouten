class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre

  def  get_image(width,height)
    unless image.attachid?
      file_path = Ralis.root.join('app/assets/images/default_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default_image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end
end
