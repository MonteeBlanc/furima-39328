require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '全ての項目が入力されていれば登録できる' do
      it 'is valid' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが重複している場合は登録できない' do
        duplicate_user = FactoryBot.create(:user, email: @user.email)
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailに@を含まない場合は登録できない' do
        @user.email = 'testemail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字未満では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'パスワードには少なくとも1つの英字と1つの数字が含まれている必要があります' do
        @user.password = 'password'
        @user.password_confirmation = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must contain at least one letter, one number, and consist of only alphanumeric characters")
      end
      
      it 'パスワードには半角英数字のみ使用できます' do
        @user.password = 'パスワード123'
        @user.password_confirmation = 'パスワード123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must contain at least one letter, one number, and consist of only alphanumeric characters")
      end

      it '姓（全角）が空では登録できない' do
        @user.surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname can't be blank")
      end
    
      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.surname = 'Smith'
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname must contain only full-width characters")
      end
    
      it '名（全角）が空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
    
      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.name = 'John'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name must contain only full-width characters")
      end
    
      it '姓（カナ）が空では登録できない' do
        @user.surname_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname katakana can't be blank")
      end
    
      it '姓（カナ）にカタカナ以外の文字が含まれていると登録できない' do
        @user.surname_katakana = 'すみす'
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname katakana is invalid")
      end
    
      it '名（カナ）が空では登録できない' do
        @user.name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name katakana can't be blank")
      end
    
      it '名（カナ）にカタカナ以外の文字が含まれていると登録できない' do
        @user.name_katakana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name katakana is invalid")
      end
    
      it '生年月日が空では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end