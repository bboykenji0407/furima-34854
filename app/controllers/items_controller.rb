class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item,          only: [:show, :edit, :update, :destroy]
  before_action :move_to_index,      only: [:edit, :update, :destroy]
  before_action :item_search,  only: [:index, :search, :show]
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
  end

  def edit
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

  def search
    @results = @p.result
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description,:category_id, :state_id, :burden_id, :area_id, :day_id, :price ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def move_to_index
    unless @item.user == current_user && @item.purchase == nil
      redirect_to root_path
    end
  end


  def item_search
    @p = Item.ransack(params[:q])
  end

end
