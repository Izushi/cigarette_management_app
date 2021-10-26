class CigarInfo < ApplicationRecord
  belongs_to :user
  # validates :img, presence: true
  validate :img_size
  validates :brand, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :text, length: { maximum: 200 }

  mount_uploader :img, ImgUploader

  private
  # 最新のスマホに対応した画像サイズ
  def img_size
    if img.size > 5.megabyte
      errors.add(:img, "が5MB以上です")
    end
  end

end
