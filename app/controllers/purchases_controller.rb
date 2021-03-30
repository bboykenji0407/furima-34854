class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item,  only: [:index, :create]

  def index
    if current_user == @item.user
      redirect_to root_path
    else
      @purchase_shipping_address = PurchaseShippingAddress.new 
    end
  end

  def create
    if @item.purchase && current_user.id
      redirect_to root_path
    else
      @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
      if @purchase_shipping_address.valid?
        pay_item
        @purchase_shipping_address.save
        return  redirect_to root_path
      else
        render :index
      end
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :area_id, :city, :street, :building, :tell_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
