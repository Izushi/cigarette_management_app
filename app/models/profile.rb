class Profile < ApplicationRecord
  # belongs_to :graph
  validates :box_price, presence: true, numericality: { only_integer: true }
  validates :cigar_amount, presence: true, numericality: { only_integer: true }
end
