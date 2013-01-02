require 'spec_helper'

describe "email_templates/edit" do
  before(:each) do
    @email_template = assign(:email_template, stub_model(EmailTemplate))
  end

  it "renders the edit email_template form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => email_templates_path(@email_template), :method => "post" do
    end
  end
end
