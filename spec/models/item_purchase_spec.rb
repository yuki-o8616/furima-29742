require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  describe '商品購入機能実装' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase = FactoryBot.build(:item_purchase)
      @purchase.user_id = @item.user_id
      @purchase.item_id = @user.id
      sleep 1
    end

    context '登録できるパターン' do
      it '全ての項目が揃っていれば購入できる' do
        expect(@purchase).to be_valid
      end
      it '建物名（building_name）は空欄でも購入できる' do
        @purchase.building_name = nil
        expect(@purchase).to be_valid
      end
    end

    context '登録できないパターン' do
      # prefecture_count = Prefecture.count
      it 'ログインしていない（ユーザIDが空欄）場合登録できない' do
        @purchase.user_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end
      it 'クレジットカードが不正（token生成失敗）の場合登録できない' do
        @purchase.token = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空欄の場合登録できない' do
        @purchase.post_code = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が不正（ハイフンがない）の場合登録できない' do
        @purchase.post_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Post code is invalid')
      end
      it '都道府県が空欄の場合登録できない' do
        @purchase.prefecture_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が未選択の場合登録できない' do
        @purchase.prefecture_id = 0
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Prefecture Select')
      end

      it '市区町村が空欄の場合登録できない' do
        @purchase.city = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空欄の場合登録できない' do
        @purchase.house_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空欄の場合登録できない' do
        @purchase.phone_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が不正（12桁以上）の場合登録できない' do
        @purchase.phone_number = '012345678901'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it '電話番号が不正（ハイフンあり）の場合登録できない' do
        @purchase.phone_number = '123-1234-1234'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it '電話番号が不正（全角数字）の場合登録できない' do
        @purchase.phone_number = '１２３４５６７８９０'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
