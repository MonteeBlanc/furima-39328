require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    category = FactoryBot.create(:category, name: 'カテゴリー')
    condition = FactoryBot.create(:condition, name: '新品')
    shipping_day = FactoryBot.create(:shipping_day, name: '1-2日で発送')
    shipping_fee_payer = FactoryBot.create(:shipping_fee_payer, name: '送料込み（出品者負担）')
    shipping_area = FactoryBot.create(:shipping_area, name: '都道府県')
    @item = FactoryBot.build(:item, condition: condition, category: category, shipping_day: shipping_day, shipping_fee_payer: shipping_fee_payer, shipping_area: shipping_area)
    @order = FactoryBot.build(:order, item: @item)
  end

  context '内容に問題がある場合' do
    it 'priceが空では保存できないこと' do
      @order.price = nil
      expect(@order).not_to be_valid
    end

    it 'tokenが空では登録できないこと' do
      @order.token = nil
      expect(@order).not_to be_valid
    end
  end
end


