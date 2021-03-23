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
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '画像が存在しない場合は登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'descriptionが空の時では保存できない' do
        @item.description = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'state_idが未選択の場合は登録できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("State is not a number")
      end
      it 'state_idが1の時は登録できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end
      it 'category_idが未選択の場合は登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'category_idが1の時は登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'burden_idが未選択の場合は保存できない' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden is not a number")
      end
      it 'burden_idが1の時は登録できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 1")
      end
      it 'area_idが未選択の場合は登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area is not a number")
      end
      it 'area_idが1の時は登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it 'day_idが未選択の場合は保存できない' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day is not a number")
      end
      it 'day_idが1の時は登録できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end
      it 'priceが空の場合は保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'itemが9999999円以上の時は登録できない' do
        @item.price = 10000000 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
      it 'itemが300未満の時は登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it 'priceが全角数字は登録できない' do
        @item.price = '９９９'  
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが文字では登録できない' do
        @item.price = 'あいうえお'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
