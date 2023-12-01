class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :no_sellers_to_root, only: [:edit, :update, :destroy]
  before_action :soldout_to_root, only: [:edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
    @have_no_item = Item.none?
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_cost_on_id,
                                 :prefecture_id, :days_to_shipping_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def no_sellers_to_root
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def soldout_to_root
    redirect_to root_path if user_signed_in? && @item.purchase
  end
end
