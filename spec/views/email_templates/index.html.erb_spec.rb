require 'spec_helper'

describe "email_templates/index" do
  before(:each) do
    assign(:email_templates, [
      stub_model(EmailTemplate),
      stub_model(EmailTemplate)
    ])
  end

  it "renders a list of email_templates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
