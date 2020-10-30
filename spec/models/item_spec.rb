require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能実装' do
    before do
      @item = FactoryBot,build(:item)
      has_one_attached :image
end
