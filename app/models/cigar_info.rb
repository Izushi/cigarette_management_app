class CigarInfo < ApplicationRecord
  validates :brand, presence: true, length: { maximum: 50 }
  validates :price, presence: true
  validates :text, length: { maximum: 200 }

  mount_uploader :img, ImgUploader
end
