class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postcode, :prefecture_id, :municipality, :street_address,
                                             :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
