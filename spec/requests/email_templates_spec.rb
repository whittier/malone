require 'spec_helper'
require 'capybara/dsl'
include Capybara::DSL

describe "EmailTemplates" do

  let(:person) { FactoryGirl.create(:person, password: "password", password_confirmation: "password", email: "user@host.com") }

  describe "GET /email_templates" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers

      ApplicationController.any_instance.stub(:current_person).and_return(person)
      get email_templates_path
      response.status.should be(200)
    end
  end
end
