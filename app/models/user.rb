class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :lists, dependent: :destroy


  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { in: 2..15}

  # 退会機能 (falseならtrueを返すようにしている)
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  # ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@test.com', name: 'guest') do |user|
      user.password = SecureRandom.urlsafe_base64 # ランダムなパスワードを生成
    end
  end

end
