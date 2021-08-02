class Profile < ApplicationRecord
  validates :box_price, presence: true, numericality: { only_integer: true }
  validates :cigar_amount, presence: true, numericality: { only_integer: true }
end
