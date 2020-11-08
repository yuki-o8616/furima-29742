FactoryBot.define do
  factory :item_purchase do
    Faker::Config.locale = :ja
    post_code { "#{rand(100..999)}-#{rand(1000..9999)}" }
    prefecture_id   { rand(1..47) }
    city            { Faker::Lorem.sentence }
    address         { "#{rand(1..10)}-#{rand(1..10)}" }
    building_name   { Faker::Name.name }
    phone_number    { '09036942281' }
    token           { ENV['PAYJP_PUBLIC_KEY'] }
    house_number    { '220-3342' }
  end
end
