require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能実装' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('/files/test_image.jpg')
    end

    context '登録できるパターン' do
      it '全ての項目が揃っていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '登録できないパターン' do
      it '商品名が空では登録できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明が空では登録できないこと' do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end

      it 'カテゴリーが空では登録できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'カテゴリーが未選択（値：1）の場合は登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category You need to select')
      end

      it '商品の状態が空では登録できないこと' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '商品の状態が未選択（値：1）の場合は登録できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition You need to select')
      end

      it '発送費の負担が空では登録できないこと' do
        @item.postage_payer_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank")
      end

      it '発送料の負担が未選択（値：1）の場合は登録できない' do
        @item.postage_payer_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage payer You need to select')
      end

      it '発送するまでの日にちが空では登録できないこと' do
        @item.preparation_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day can't be blank")
      end

      it '発送料の負担が未選択（値：1）の場合は登録できない' do
        @item.postage_payer_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage payer You need to select')
      end

      it '発送元の地域が空では登録できないこと' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送元の地域が未選択（値：1）の場合は登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture You need to select')
      end

      it '価格が未入力では登録できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300未満では登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price range invalid')
      end

      it '価格が10,000,000以上では登録できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price range invalid')
      end
    end
  end
end
