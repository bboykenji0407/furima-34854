class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
         has_many :items

  with_options presence: true do
    validates :nickname
    validates :date_of_birth
    with_options format: { with: /\A[ぁ-んァ-ンー-龥々]+\z/, message: 'は全角文字を使用してください' } do 
      validates :first_name 
      validates :last_name 
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カナを使用してください' } do
      validates :first_name_kana 
      validates :last_name_kana
    end
  end
   validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は半角英数字混合にしてください'}
end
  