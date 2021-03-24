class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, ]
  before_action :move_to_index,     except: [:index, :show]
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless @item.user == current_user
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
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
  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
