class ItemsController < ApplicationController
  before_action #:set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all.order(created_at: 'DESC')
  end

  def new
    @item = Item.new
  end

  
  def create
    @item = Item.new(item_params)

    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :content, :prefecture_id, :condition_id, :postage_payer_id, :preparation_day_id, :category_id, :image).merge(user_id: current_user.id)
  end
end
