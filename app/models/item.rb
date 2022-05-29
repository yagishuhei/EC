class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  has_one_attached :image

##imageのサイズ変更、imageがなければ用意したno_imageで返す

  def get_image(size)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-iamge.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize:size).processed
  end

end
