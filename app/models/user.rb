class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :lists, dependent: :destroy


  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { in: 2..15}

  # falseならtrueを返すようにしている
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

end
