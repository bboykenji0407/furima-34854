class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item,          only: [:show, :edit, :update, :destroy]
  before_action :move_to_index,      only: [:edit, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @purchases = Purchase.all
  end

  def edit
    @item.purchase
    redirect_to root_path
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)  
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description,:category_id, :state_id, :burden_id, :area_id, :day_id, :price ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def move_to_index
    unless @item.user == current_user
      redirect_to root_path
    end
  end
end
