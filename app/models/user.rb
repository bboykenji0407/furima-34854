class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  with_options presence: true do
    with_options format: { with: /\A[ぁ-んァ-ンー-龥]+\z/, message: '全角文字を使用してください' } do 
      validates :first_name 
      validates :last_name 
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナを使用してください' } do
      validates :first_name_kana 
      validates :last_name_kana
    end
  end
  validates :date_of_birth, presence: true
  validates :password, format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/, message: '半角英数字混合にしてください'}
end
  