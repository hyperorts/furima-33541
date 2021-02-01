FactoryBot.define do
  factory :user do
    nickname {Faker::Name.male_first_name}
    email {Faker::Internet.free_email}
    password {"1a" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name {"阿阿阿"}
    first_name {"阿阿阿"}
    family_name_kana {"アアア"}
    first_name_kana {"アアア"}
    birthday {"1930-01-01"}
  end
end
