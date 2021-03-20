FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.initials(number: 2) }
    email                  { Faker::Internet.free_email }
    password               { Faker::Internet.password(min_length: 6) }
    password_confirmation  { password }
    first_name             { '鈴木' }
    last_name              { '大将' }
    first_name_kana        { 'カナ' }
    last_name_kana         { 'カナ' }
    date_of_birth          { '1992-04-07' }
  end
end
