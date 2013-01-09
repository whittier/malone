# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :email_template do
    name    "factory name"
    subject "factory subject"
    body    "factory body"
  end
end
