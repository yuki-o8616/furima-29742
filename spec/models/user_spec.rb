require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録'  do
    before do
      @user = FactoryBot.build(:user)
    end

    context "登録できるパターン" do
      it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
        expect(@user).to be_valid
      end
    end

    context "登録できないパターン" do
      it "nicknameが空では登録できないこと" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailに＠がなければ登録できないこと" do
        @user.email = "emk@emill"
        @user.valid?
        expect(@user.errors.full_messages).to include("email can't be need @")
      end

      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("password can't be blank")
      end
      
      it "passwordが6文字未満では登録ができない" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        expect(@user).to be_valid
      end

      it "passwordとpassword_confirmationが不一致では登録できないこと" do

        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "password_confirmationがなければ登録ができない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("password_confirmation can't be blank")
      end
      
      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user =  User.new(nickname: "Faker::Name.last_name", email: "Faker::Internet.free_email", password: "b4j23K45", password_confirmation: "b4j23K45")       
        another_user.email = @user.email 
        another_user.valid?
        expect(another_user.errors.full_messages).to include( "Cannot register if there are duplicate emails")
      end

      it "passwordは半角英数混合でなければ登録ができない" do
        @user.password = "222222"
        @user.valid?
        expect(@user.errors.full_messages).to include("password cannot be registered unless it is a mixture of half-width alphanumeric characters")
      end

      it "family_nameが空だと登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("family_Name can't be blank")
      end

      it "first_nameが空だと登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("first_Name can't be blank")
      end

      it "フリガナ（苗字）が全角（漢字・ひらがな・カタカナ）以外だと登録できない" do
        @user.family_name = yamada
        @user.valid?
        expect(@user.errors.full_messages).to include("Registration is not possible unless Frigana is full-width (Kanji, Hiragana, Katakana)")

      end

      it "フリガナが全角(名前）（漢字・ひらがな・カタカナ）以外だと登録できない" do
        @user.first_name = tarou
        @user.valid?
        expect(@user.errors.full_messages).to include("Registration is not possible unless Frigana is full-width (Kanji, Hiragana, Katakana)")

      end

      it "フリガナ(苗字）が全角以外だと登録できない" do
        @user.family_name = yamada
        @user.valid?
        expect(@user.errors.full_messages).to include("cannot register if Frigana is not full-width")

      end
      it "フリガナ（名前）が全角以外だと登録できない" do
        @user.first_name = tarou
        @user.valid?
        expect(@user.errors.full_messages).to include("cannot register if Frigana is not full-width")

      it "生年月日が空だと登録できない" do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Cannot register if the date of birth is empty")
      end
    end
  end
end