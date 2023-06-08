require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  describe 'バリデーション' do
    let(:user) { FactoryBot.create(:user) }
    let(:item) { FactoryBot.create(:item) }
    let(:shipping_information) { FactoryBot.build(:shipping_information, user: user) }
    let(:purchase_form) { PurchaseForm.new(user_id: user.id, item_id: item.id, shipping_information: shipping_information) }

    context '正常なデータの場合' do
      it '正常にバリデーションが通ること' do
        expect(purchase_form).to be_valid
      end
    end

    context '不正なデータの場合' do
      it 'user_idがない場合はバリデーションエラーになること' do
        purchase_form.user_id = nil
        expect(purchase_form).to be_invalid
        expect(purchase_form.errors[:user_id]).to include("は入力必須です")
      end

      it 'item_idがない場合はバリデーションエラーになること' do
        purchase_form.item_id = nil
        expect(purchase_form).to be_invalid
        expect(purchase_form.errors[:item_id]).to include("は入力必須です")
      end

      it 'shipping_informationのpostal_codeがない場合はバリデーションエラーになること' do
        purchase_form.shipping_information.postal_code = nil
        expect(purchase_form).to be_invalid
        expect(purchase_form.errors[:shipping_information][:postal_code]).to include("は入力必須です")
      end

      it 'shipping_informationのpostal_codeが正しい形式でない場合はバリデーションエラーになること' do
        purchase_form.shipping_information.postal_code = '1234567'
        expect(purchase_form).to be_invalid
        expect(purchase_form.errors[:shipping_information][:postal_code]).to include("はハイフンを含む7桁の数字で入力してください")
      end

      it 'shipping_informationのshipping_area_idがない場合はバリデーションエラーになること' do
        purchase_form.shipping_information.shipping_area_id = nil
        expect(purchase_form).to be_invalid
        expect(purchase_form.errors[:shipping_information][:shipping_area_id]).to include("は入力必須です")
      end

      it 'shipping_informationのcityがない場合はバリデーションエラーになること' do
        purchase_form.shipping_information.city = nil
        expect(purchase_form).to be_invalid
        expect(purchase_form.errors[:shipping_information][:city]).to include("は入力必須です")
      end

      it 'shipping_informationのstreetがない場合はバリデーションエラーになること' do
        purchase_form.shipping_information.street = nil
        expect(purchase_form).to be_invalid
        expect(purchase_form.errors[:shipping_information][:street]).to include("は入力必須です")
      end

      it 'shipping_informationのphone_numberがない場合はバリデーションエラーになること' do
        purchase_form.shipping_information.phone_number = nil
        expect(purchase_form).to be_invalid
        expect(purchase_form.errors[:shipping_information][:phone_number]).to include("は入力必須です")
      end

      it 'shipping_informationのphone_numberが正しい形式でない場合はバリデーションエラーになること' do
        purchase_form.shipping_information.phone_number = '090-1234-5678'
        expect(purchase_form).to be_invalid
        expect(purchase_form.errors[:shipping_information][:phone_number]).to include("はハイフンなしの10桁または11桁の数字で入力してください")
      end
    end
  end
end