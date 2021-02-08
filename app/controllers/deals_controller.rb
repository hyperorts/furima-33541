class DealsController < ApplicationController
  before_action  :set_item, only:[:index ,:create]
  before_action :authenticate_user!, only: [:index,:create]

  def index
    if @item.user_id == current_user.id || @item.deal.present?
      redirect_to root_path
    else
      @deal = Buyer.new
    end
  end

  def create
    @deal = Buyer.new(deal_params)
    if @deal.valid?
      pay_item
      @deal.save
      redirect_to root_path
    else
      render :index
    end
  end



    private

    def deal_params
      params.require(:buyer).permit(:postal_code,:prefecture_id,:municipality,:address_number,:building_name,:phone_number).merge(user_id: current_user.id,item_id:params[:item_id],token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: deal_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
    end

    def set_item
      @item = Item.find(params[:item_id])
    end
end