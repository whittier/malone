require 'spec_helper'

describe "email_templates/new" do
  before(:each) do
    assign(:email_template, stub_model(EmailTemplate).as_new_record)
  end

  it "renders new email_template form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => email_templates_path, :method => "post" do
    end
  end
end
