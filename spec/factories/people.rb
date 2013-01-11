# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    password_digest "MyString"
    auth_token "MyString"
    email "MyString"
  end
end
