require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  describe 'validations' do
    let(:purchase_form) { FactoryBot.build(:purchase_form) }

    describe '配送先情報の保存' do
      context '配送先情報の保存ができるとき' do
        it 'すべての値が正しく入力されていれば保存できること' do
          purchase_form.user_id = 1
          purchase_form.item_id = 1
          expect(purchase_form).to be_valid
        end
        it 'user_idが空でなければ保存できる' do
          purchase_form.user_id = 1
          expect(purchase_form).to be_valid
        end
        it 'item_idが空でなければ保存できる' do
          purchase_form.item_id = 1
          expect(purchase_form).to be_valid
        end
        it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
          purchase_form.postal_code = '123-4560'
          purchase_form.user_id = 1
          purchase_form.item_id = 1
          expect(purchase_form).to be_valid
        end
        it '都道府県が「---」以外かつ空でなければ保存できる' do
          purchase_form.shipping_area_id = 2
          purchase_form.user_id = 1
          purchase_form.item_id = 1
          expect(purchase_form).to be_valid
        end
        it '市区町村が空でなければ保存できる' do
          purchase_form.city = '横浜市'
          purchase_form.user_id = 1
          purchase_form.item_id = 1
          expect(purchase_form).to be_valid
        end
        it '番地が空でなければ保存できる' do
          purchase_form.street = '旭区１２３'
          purchase_form.user_id = 1
          purchase_form.item_id = 1
          expect(purchase_form).to be_valid
        end
        it '電話番号が11桁以内かつハイフンなしであれば保存できる' do
          purchase_form.phone_number = '12345678910'
          purchase_form.user_id = 1
          purchase_form.item_id = 1
          expect(purchase_form).to be_valid
        end
      end

      context '配送先情報の保存ができないとき' do
        it 'user_idが空だと保存できないこと' do
          purchase_form.user_id = nil
          purchase_form.valid?
          expect(purchase_form.errors[:user_id]).to include("can't be blank")
        end
        it 'item_idが空だと保存できないこと' do
          purchase_form.item_id = nil
          purchase_form.valid?
          expect(purchase_form.errors[:item_id]).to include("can't be blank")
        end
        it '郵便番号が空だと保存できないこと' do
          purchase_form.postal_code = nil
          purchase_form.valid?
          expect(purchase_form.errors[:postal_code]).to include("can't be blank")
        end
        it '郵便番号にハイフンがないと保存できないこと' do
          purchase_form.postal_code = '1234567'
          purchase_form.valid?
          expect(purchase_form.errors[:postal_code]).to include('はハイフンを含む7桁の数字で入力してください')
        end
        it '都道府県が「---」だと保存できないこと' do
          purchase_form.shipping_area_id = 0
          purchase_form.valid?
          expect(purchase_form.errors[:shipping_area_id]).to include("を選択してください")
        end
        it '都道府県が空だと保存できないこと' do
          purchase_form.shipping_area_id = nil
          purchase_form.valid?
          expect(purchase_form.errors[:shipping_area_id]).to include("can't be blank")
        end
        it '市区町村が空だと保存できないこと' do
          purchase_form.city = nil
          purchase_form.valid?
          expect(purchase_form.errors[:city]).to include("can't be blank")
        end
        it '番地が空だと保存できないこと' do
          purchase_form.street = nil
          purchase_form.valid?
          expect(purchase_form.errors[:street]).to include("can't be blank")
        end
        it '電話番号が空だと保存できないこと' do
          purchase_form.phone_number = nil
          purchase_form.valid?
          expect(purchase_form.errors[:phone_number]).to include("can't be blank")
        end
        it '電話番号にハイフンがあると保存できないこと' do
          purchase_form.phone_number = '123-1234-1234'
          purchase_form.valid?
          expect(purchase_form.errors[:phone_number]).to include('はハイフンなしの10桁または11桁の数字で入力してください')
        end
        it '電話番号が12桁以上あると保存できないこと' do
          purchase_form.phone_number = '12345678910123111'
          purchase_form.valid?
          expect(purchase_form.errors[:phone_number]).to include('はハイフンなしの10桁または11桁の数字で入力してください')
        end
        it 'トークンが空だと保存できないこと' do
          purchase_form.token = nil
          purchase_form.valid?
          expect(purchase_form.errors[:token]).to include("can't be blank")
        end
      end
    end
  end
end
