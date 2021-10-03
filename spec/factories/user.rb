FactoryBot.define do
  factory :user do
    name { '佐藤' }
    email { 'hogehoge@email.com' }
    password { 'hogehoge' }
    password_confirmation { 'hogehoge' }
  end
end