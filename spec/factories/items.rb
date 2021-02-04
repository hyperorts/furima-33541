FactoryBot.define do
  factory :item do
    name { 'テスト' }
    description { 'テスト' }
    category_id { 2 }
    status_id { 2 }
    shipping_cost_id { 2 }
    prefecture_id { 2 }
    days_ship_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/sample.jpeg'), filename: 'sample.jpeg')
    end
  end
end
