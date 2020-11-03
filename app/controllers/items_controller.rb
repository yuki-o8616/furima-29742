class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit,:update, :destroy ]
  before_action :authenticate_user!

  def index
    @items = Item.all.order(created_at: 'DESC')
  end

  def show
    #@item = Item.find(params[:id])
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
  
  #def edit
  #redirect_to root_path if @item.user.id != current_user.id
  #end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :content, :prefecture_id, :condition_id, :postage_payer_id, :preparation_day_id, :category_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
