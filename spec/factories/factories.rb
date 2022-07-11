FactoryBot.define do
  factory :user do
    email { "#{rand(1..10000)}@gmail.com" }
    name { FFaker::Name.name }
    password { "123456" }
  end
end
