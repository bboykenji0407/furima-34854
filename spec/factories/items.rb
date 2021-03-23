FactoryBot.define do
  factory :item do
    name        {"hoge"} 
    description {Faker::Lorem.sentence}
    association :user
    category_id { 2 }
    state_id    { 2 }
    burden_id   { 2 }
    area_id     { 2 }
    day_id      { 2 }
    price       {3000}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
