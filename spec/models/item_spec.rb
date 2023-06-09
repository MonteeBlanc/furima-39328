require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
  end

  describe 'Item registration' do
    context 'When item registration is possible' do
      it 'Register if all input items exist' do
        expect(@item).to be_valid
      end
    end

    context 'When item cannot be listed' do
      it "Can't list if title is blank" do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it "Can't list if description is blank" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "Can't list if price is blank" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "Can't list if condition_id is blank" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it "Can't list if condition_id is '---'" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition is not a valid choice')
      end

      it "Can't list if category_id is blank" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "Can't list if category_id is '---'" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a valid choice')
      end

      it "Can't list if shipping_day_id is blank" do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it "Can't list if shipping_day_id is '---'" do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day is not a valid choice')
      end

      it "Can't list if shipping_fee_payer_id is blank" do
        @item.shipping_fee_payer_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee payer can't be blank")
      end

      it "Can't list if shipping_fee_payer_id is '---'" do
        @item.shipping_fee_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee payer is not a valid choice')
      end
    end
  end
end
