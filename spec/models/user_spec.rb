require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/本人情報確認' do
    context '内容に問題がある場合' do
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'aaacom'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = 'aaaa1'
        @user.password_confirmation = 'aaaa1'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'パスワードは、半角英数字混合での入力が必須であること（全角）' do
        @user.password = 'A１１１１１'
        @user.password_confirmation = 'A１１１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'パスワードは、半角英数字混合での入力が必須であること（アルファベットのみ）' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'パスワードは、半角英数字混合での入力が必須であること（数字のみ）' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'パスワードは、確認用を含めて2回入力すること' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'ユーザー苗字は必須であること' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（苗字）を入力してください")
      end
      it 'ユーザー名前は必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（名前）を入力してください")
      end
      it 'ユーザー苗字は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.family_name = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（苗字）は不正な値です')
      end
      it 'ユーザー名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（名前）は不正な値です')
      end
      it 'ユーザー苗字のフリガナは必須であること' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（苗字フリガナ）を入力してください')
      end
      it 'ユーザー名前のフリガナは必須であること' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（名前フリガナ）を入力してください')
      end
      it 'ユーザー苗字のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.family_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（苗字フリガナ）は不正な値です')
      end
      it 'ユーザー名前のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.first_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（名前フリガナ）は不正な値です')
      end
      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      context '内容に問題がない場合' do
        it '新規登録成功' do
          expect(@user).to be_valid
        end
      end
    end
  end
end
