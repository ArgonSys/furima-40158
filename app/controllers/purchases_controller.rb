class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :set_key, only: [:index, :create]

  def index
    @purchase = PurchaseAddress.new
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      purchase_item
      @purchase.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postcode, :prefecture_id, :municipality, :street_address, :building, :phone_number)\
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_key
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end

  def purchase_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: @purchase.token,
      currency: 'jpy'
    )
  end
end
