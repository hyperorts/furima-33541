require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '内容に問題がある場合' do
      it '画像をつけることが必須' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("出品画像を入力してください")
      end
      it '商品名が必須' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明が必須' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリー情報が必須' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選んでください")
      end
      it 'カテゴリー情報が---では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選んでください')
      end
      it '商品状態情報が必須' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選んでください")
      end
      it '商品状態情報が---では登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選んでください')
      end
      it '配送料情報が必須' do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選んでください")
      end
      it '配送料情報が---では登録できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選んでください')
      end
      it '発送元地域情報が必須' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選んでください")
      end
      it '発送元地域情報が---では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選んでください')
      end
      it ' 発送日数情報が必須' do
        @item.days_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選んでください")
      end
      it ' 発送日数情報が---では登録できない' do
        @item.days_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選んでください')
      end
      it '価格情報が必須' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it '価格情報が¥300未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300以上の値にしてください')
      end
      it '価格情報が¥10,000,000以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は9999999以下の値にしてください')
      end
      it '価格情報が半角数字でなければ登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it '価格情報は全角文字では登録できないこと' do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it '価格情報は半角英数混合では登録できないこと' do
        @item.price = '30ab'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it '価格情報は半角英語だけでは登録できないこと' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
    end
    context '内容に問題がない場合' do
      it '商品出品ができる時' do
        expect(@item).to be_valid
      end
    end
  end
end
