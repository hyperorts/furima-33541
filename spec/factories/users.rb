FactoryBot.define do
  factory :user do
    nickname {Faker::Name.male_first_name}
    email {Faker::Internet.free_email}
    password {"1aA" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name {Faker::Name.last_name}
    first_name {Faker::Name.female_first_name}
    family_name_kana {Faker::Games.pokemon}
    first_name_kana {Faker::Games.pokemon}
    birthday {"1930-01-01"}
  end
end
