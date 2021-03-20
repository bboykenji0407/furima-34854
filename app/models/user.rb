class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ー-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name, presence: true
    validates :last_name, presence: true
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶー－]+\z/, message: '全角カナを使用してください' } do
    validates :first_name_kana, presence: true
    validates :last_name_kana, presence: true
  end
  validates :date_of_birth, presence: true
  validates :password, format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/, message: '半角英数字混合にしてください'}
end
