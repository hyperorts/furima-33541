FactoryBot.define do
  factory :buyer do
    postal_code      {"123-4567"}
    prefecture_id    {2}
    municipality     {"全角"}
    address_number   {"テスト"}
    building_name    {"テスト"}
    phone_number     {"09012345678"}
    token            {"tok_test_***********"}
    association :user
    association :item
  end
end
