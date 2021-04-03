require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品新規出品' do
    context '商品新規出品できるとき' do
      it 'image,user_id, name, item, description,state_id,burden_id,area_id,day_id,priceが存在すれば登録できる' do 
        expect(@item).to be_valid
      end
    end
    context '商品新規登録できない時' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'user_idが空のものでないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
      it '画像が存在しない場合は登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'descriptionが空の時では保存できない' do
        @item.description = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      it 'state_idが未選択の場合は登録できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it 'state_idが1の時は登録できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it 'category_idが未選択の場合は登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'category_idが1の時は登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'burden_idが未選択の場合は保存できない' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it 'burden_idが1の時は登録できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it 'area_idが未選択の場合は登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送元の地域を選択してください")
      end
      it 'area_idが1の時は登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送元の地域を選択してください")
      end
      it 'day_idが未選択の場合は保存できない' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送までの日数を選択してください")
      end
      it 'day_idが1の時は登録できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送までの日数を選択してください")
      end
      it 'priceが空の場合は保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("金額を入力してください")
      end
      it 'itemが9999999円以上の時は登録できない' do
        @item.price = 10000000 
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は9999999より小さい値にしてください")
      end
      it 'itemが300未満の時は登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は300より大きい値にしてください")
      end
      it 'priceが全角数字は登録できない' do
        @item.price = '９９９'  
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は数値で入力してください")
      end
      it 'priceが文字では登録できない' do
        @item.price = 'あいうえお'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は数値で入力してください")
      end
    end
  end
end
