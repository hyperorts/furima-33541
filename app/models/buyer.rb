class Buyer
include ActiveModel::Model

attr_accessor :user_id,:item_id,:postal_code,:prefecture_id,:municipality,:address_number,:building_name,:phone_number,:token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code,format:{with:/\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選んでください' }
    validates :municipality,format:{with:/\A[一-龥ぁ-ん]/}
    validates :address_number
    validates :phone_number,format:{with:/\A\d{11}\z/}
    validates :token
  end

  def save
    deal = Deal.create(user_id: user_id,item_id: item_id)
    Address.create(postal_code: postal_code,prefecture_id: prefecture_id,municipality: municipality,address_number:address_number, building_name:building_name,phone_number: phone_number,deals_id: deal.id)
  end
end