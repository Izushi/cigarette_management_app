class CigarInfo < ApplicationRecord
  validates :brand, presence: true, length: { maximum: 50 }
  validates :text, presence: true, length: { maximum: 200 }
end
