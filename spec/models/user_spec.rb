require 'rails_helper' # rails_helperというファイルを呼び出している記述があります。

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_name,last_name,first_name_kana,last_name_kana,date_of_birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailは@が含まれている' do
        @user.email = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'password:半角英数混合(半角英語のみ)' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include( "パスワードは半角英数字混合にしてください")
      end
      it 'passwordが数字のみでは登録できないこと' do
        @user.password = '7777777'
        @user.valid?
        expect(@user.errors.full_messages).to include( "パスワードは半角英数字混合にしてください")
      end
      it 'passwordが全角だと登録できない' do
        @user.password = 'かきくけこ'
        @user.valid?
        expect(@user.errors.full_messages).to include( "パスワードは半角英数字混合にしてください")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it 'first_nameが半角だと登録できない' do
        @user.first_name = 'Ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字は全角文字を使用してください')
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'last_nameが半角だと登録できない' do
        @user.last_name = 'aG'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は全角文字を使用してください')
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字カナを入力してください")
      end
      it 'first_name_kanaがカタカナでないと登録できない' do
        @user.first_name_kana = 'ty'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字カナは全角カナを使用してください')
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナを入力してください")
      end
      it 'last_name_kanaがカタカナでないとと登録できない' do
        @user.last_name_kana = '感'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前カナは全角カナを使用してください')
      end
      it 'date_of_birthが空だと登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
