class ItemsController < ApplicationController
<<<<<<< Updated upstream
  before_action :authenticate_user!, only: [:new, :create]
=======
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item,          only: [:show, :edit, :update,]
  before_action :move_to_index,      only: [:edit, :update]
>>>>>>> Stashed changes
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

  private

  def item_params
    params.require(:item).permit(:name, :image, :description,:category_id, :state_id, :burden_id, :area_id, :day_id, :price ).merge(user_id: current_user.id)
  end
end
