class PurchasesController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!, only: [:index]

  def index
    item_present?
    @purchase = ItemPurchase.new
  end

  def create
    @purchase = ItemPurchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def item_present?
    redirect_to root_path if @item.purchase.present?
    redirect_to root_path if @item.user_id == current_user.id
  end
  
  

  def purchase_params
    params.require(:item_purchase).permit(:post_code, :prefecture_id, :city, :phone_number, :house_number, :building_name).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
