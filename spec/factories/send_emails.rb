# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :send_email do
    filename "thefilename"
    email_template_id "1"
  end
end
