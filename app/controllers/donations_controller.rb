class  DonationsController < ApplicationController
  def index
  end
 
  def new
    @user_donation = UserDonation.new   #「UserDonation」に編集
  end
 
  def create
    user = User.create(user_params)
    Address.create(address_params(user))
    Donation.create(donation_params(user))
    redirect_to action: :index
  end
  private
   # 全てのストロングパラメーターを1つに統合
  def donation_params
   params.require(:user_donation).permit(:name, :name_reading, :nickname, :postal_code, :prefecture, :city, :house_number, :building_name, :price)
  end
 
 end
 