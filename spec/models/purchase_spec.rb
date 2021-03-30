#require 'rails_helper'

#RSpec.describe Purchase, type: :model do#
#  describe '購入先情報の保存' do#
#    before do
#      user = FactoryBot.create(:user)
#      @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address, user_id: user.id)
#    end
#
#    it 'user_id,item_id,postal_code,area_id,city,street,tell_numが存在すれば購入できる' do
#        expect(@purchase_shipping_address).to be_valid
#    end
#    it 'postal_codeが空だと保存ができない' do
#      @purchase_shipping_address.postal_code = ''
#      @purchase_shipping_address.valid?
#      binding.pry
#      expect(@purchase_shipping_address.errors.full_message).to include("Postal code can't be blank")
#    end
#  end
#end
