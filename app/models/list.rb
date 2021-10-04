class List < ApplicationRecord

  belongs_to :user
  has_many :cards, dependent: :destroy

  validates :title, presence: true, length: { in: 1..40 }
end
