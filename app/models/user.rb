class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  FULL_WIDTH = /\A[ぁ-んァ-ン一-龥々]+\z/
  FULL_WIDTH_KATAKANA = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: FULL_WIDTH,allow_blank: true}
    validates :first_name, format: { with: FULL_WIDTH,allow_blank: true}
    validates :family_name_kana, format: { with: FULL_WIDTH_KATAKANA,allow_blank: true}
    validates :first_name_kana, format: { with: FULL_WIDTH_KATAKANA,allow_blank: true}
    validates :password, format: { with:  /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,allow_blank: true}
    validates :birthday
  end

  has_many :items
  has_many :deal
end
