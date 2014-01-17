FactoryGirl.define do
  factory :user do
    name     "Jonas Galante"
    email    "jonas@example.com"
    password "123456"
    password_confirmation "123456"
  end
end