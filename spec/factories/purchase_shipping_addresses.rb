FactoryBot.define do
  factory :purchase_shipping_address do
    user_id     { 1 }
    item_id     { 1 }
    postal_code { "123-4567" }
    area_id     { 3 }
    city        {'小金井'}
    street      {'適当'}
    tell_num    {"09000999900"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
