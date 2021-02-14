require 'rails_helper'

RSpec.describe Buyer, type: :model do
  before do
    seller = FactoryBot.create(:user)
    buyer = FactoryBot.create(:user)
    item =  FactoryBot.create(:item, user_id:seller.id)
    @buyer = FactoryBot.build(:buyer, user_id: buyer.id, item_id: item.id)
    sleep(2)
  end
  describe '商品購入' do
    context '内容に問題がある場合' do
    end
      it "郵便番号が空では購入不可" do
        @buyer.postal_code = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("郵便番号を入力してください")
      end
      it "郵便番号に-（ハイフン）が必須" do
        @buyer.postal_code = "0000000"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it "都道府県が空では購入不可" do
        @buyer.prefecture_id = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("都道府県を選んでください")
      end
      it "都道府県が--では購入不可" do
        @buyer.prefecture_id = 1
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("都道府県を選んでください")
      end
      it "市区町村が空では購入不可" do
        @buyer.municipality  = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("市区町村を入力してください")
      end
      it "市区町村は全角での入力が必須" do
        @buyer.municipality = "a"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("市区町村は不正な値です")
      end
      it "番地なしでは購入不可" do
        @buyer.address_number = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("番地を入力してください")
      end
      it "電話番号なしでは購入不可" do
        @buyer.phone_number  = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("電話番号を入力してください")
      end
      it "電話番号は半角数字での入力が必須" do
        @buyer.phone_number  = "０９０１２３４５６７８"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "電話番号は１２文字以上では購入不可" do
        @buyer.phone_number  = "090123456789"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include( "電話番号は不正な値です")
      end
      it "電話番号は英数混合では購入不可" do
        @buyer.phone_number  = "090abcdefgh"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include( "電話番号は不正な値です")
      end
      it "user_idなしでは購入不可" do
        @buyer.user_id = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Userを入力してください")
      end
      it "item_idなしでは購入不可" do
        @buyer.item_id = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Itemを入力してください")
      end
      it "tokenなしでは購入不可" do
        @buyer.token = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    context '内容に問題がない場合' do
      it "上記の条件が全て満たされた場合は購入可" do
        expect(@buyer).to be_valid
      end
      it "建物名なしでも購入可" do
        @buyer.building_name = ""
        expect(@buyer).to be_valid
      end
    end
  end
end