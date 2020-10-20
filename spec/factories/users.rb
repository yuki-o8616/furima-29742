FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    password { 'b4j23K45' } 
    email { Faker::Internet.free_email }
    password_confirmation { 'b4j23K45' }
    family_name{ '花山' }
    first_name{ '雄介'}
    family_name_kana{ 'ハナヤマ' }
    first_name_kana{ 'ユウスケ'}
    birth_day { Faker::Date.in_date_period }
  end
end
