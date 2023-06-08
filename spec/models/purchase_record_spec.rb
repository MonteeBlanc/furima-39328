require 'rails_helper'

RSpec.describe PurchaseRecord, type: :model do
  before do
    category = FactoryBot.create(:category, name: 'カテゴリー')
    condition = FactoryBot.create(:condition, name: '新品')
    shipping_day = FactoryBot.create(:shipping_day, name: '1-2日で発送')
    shipping_fee_payer = FactoryBot.create(:shipping_fee_payer, name: '送料込み（出品者負担）')
    shipping_area = FactoryBot.create(:shipping_area, name: '都道府県')
    @item = FactoryBot.build(:item, condition: condition, category: category, shipping_day: shipping_day, shipping_fee_payer: shipping_fee_payer, shipping_area: shipping_area)
    @purchase_record = FactoryBot.build(:purchase_record, item_price: @item.price, item: @item)
  end

  context '内容に問題がある場合' do
    it 'item_priceが空では保存できないこと' do
      @purchase_record.item_price = nil
      expect(@purchase_record).not_to be_valid
    end

    it 'tokenが空では登録できないこと' do
      @purchase_record.token = nil
      expect(@purchase_record).not_to be_valid
    end
  end
end








