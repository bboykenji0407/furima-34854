require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  describe '購入先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address, item_id: item.id, user_id: user.id)
      sleep 0.1 # 0.1秒待機 (コードが読み込まれなかった)
    end
    context '購入先が保存できる時' do
      it "tokenがあれば保存ができること" do
        expect(@purchase_shipping_address).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @purchase_shipping_address.building = ''
        expect(@purchase_shipping_address).to be_valid
      end
      it 'user_id,item_id,postal_code,area_id,city,street,tell_numが存在すれば購入できる' do
        expect(@purchase_shipping_address).to be_valid
      end
    end
    context '購入先情報が保存できない時' do  
      it 'user_idが空では保存できないこと' do
        @purchase_shipping_address.user_id = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @purchase_shipping_address.item_id = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが空だと保存ができない' do
        @purchase_shipping_address.postal_code = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeがハイフン無しでは保存できないこと' do
        @purchase_shipping_address.postal_code = '0000000'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "tokenが空では保存できないこと" do
        @purchase_shipping_address.token = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Token can't be blank")  
      end
      it 'postal_codeが半角数字以外だと保存できない' do
        @purchase_shipping_address.postal_code = '０かき'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'area_idが空だと保存できない' do
        @purchase_shipping_address.area_id = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空だと保存できない' do
        @purchase_shipping_address.city = ""
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空だと保存できない' do
        @purchase_shipping_address.street = ""
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Street can't be blank")
      end
      it 'tell_numが空だと保存できない' do
        @purchase_shipping_address.tell_num = ""
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Tell num can't be blank")
      end
      it 'tell_numが全角文字では保存できない' do
        @purchase_shipping_address.tell_num = "かきく"
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Tell num は半角数字のみ使用してください")
      end
      it 'tell_numが全角数字では保存できない' do
        @purchase_shipping_address.tell_num = "０００００００００"
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Tell num は半角数字のみ使用してください") 
      end
      it '半角英数字混合では登録できない' do
        @purchase_shipping_address.tell_num = "00aa000bb"
        @purchase_shipping_address.valid?
        #binding.pry
        expect(@purchase_shipping_address.errors.full_messages).to include("Tell num は半角数字のみ使用してください")
      end
      it '１２桁以上は登録できない' do
        @purchase_shipping_address.tell_num = "000000000000"
        @purchase_shipping_address.valid?
        #binding.pry
        expect(@purchase_shipping_address.errors.full_messages).to include("Tell num は11桁以内で入力してください")
      end
    end
  end
end
