class CigarInfo < ApplicationRecord
  validates :img, presence: true
  validate :img_size
  validates :brand, presence: true, length: { maximum: 50 }
  validates :price, presence: true
  validates :text, length: { maximum: 200 }

  mount_uploader :img, ImgUploader

  private
  def img_size
    if img.size > 1.megabyte
      errors.add(:img, "が1MB以上です")
    end
  end

end
