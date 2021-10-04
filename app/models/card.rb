class Card < ApplicationRecord

  belongs_to :list

  validates :title, presence: true, length: { in: 1..20 }
  validates :memo,  length: { maximum: 1000 }
  validates :deadline, presence: true
end
