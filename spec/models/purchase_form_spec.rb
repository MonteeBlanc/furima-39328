require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  describe 'validations' do
    let(:purchase_form) { PurchaseForm.new }

    it 'requires user_id' do
      purchase_form.valid?
      expect(purchase_form.errors[:user_id]).to include("can't be blank")
    end

    it 'requires item_id' do
      purchase_form.valid?
      expect(purchase_form.errors[:item_id]).to include("can't be blank")
    end

    it 'requires postal_code' do
      purchase_form.valid?
      expect(purchase_form.errors[:postal_code]).to include("can't be blank")
    end

    it 'requires valid postal_code format' do
      purchase_form.postal_code = '1234567'
      purchase_form.valid?
      expect(purchase_form.errors[:postal_code]).to include("はハイフンを含む7桁の数字で入力してください")
    end

    it 'requires shipping_area_id' do
      purchase_form.valid?
      expect(purchase_form.errors[:shipping_area_id]).to include("can't be blank")
    end

    it 'requires token' do
      purchase_form.valid?
      expect(purchase_form.errors[:token]).to include("can't be blank")
    end
  end
end
