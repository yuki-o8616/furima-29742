class ItemsController < ApplicationController
  
  def index
   
  end

  def new
    @item = Item.new
    
  end
  
  def create
    @item = Item.new(item_params)
    
    if @item.valid?
      @item.save
      return redirect_to root_path
    end
      render 'new'
      # redirect_to new_item_path, flash: { alert: "必須項目を入力して下さい"}
  end

  
    private

    def item_params
      params.require(:item).permit(:name, :introduction, :price, :prefecture_id,  :condition_id, :postage_payer_id, :preparation_day_id,:category_id,:image).merge(user_id: current_user.id)
    end
  end   
  