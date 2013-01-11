require 'spec_helper'

describe SendEmailController do

  before(:each) do
    controller.should_receive(:require_person)
  end

  def valid_email_template_attributes
    {
        name: "name",
        subject: "subject",
        body: "body"
    }
  end

  def valid_attributes
    {
        filename: "filename",
    }
  end

  def valid_session
    {}
  end

  describe "GET prepare_to_send" do
    it "assigns a new email_template as @email_template" do

      email_template = EmailTemplate.create! valid_email_template_attributes

      get :prepare_to_send,  { id: email_template.id } , valid_session
      assigns(:send_email).email_template_id.should eq(email_template.id)
    end
  end

  describe "POST send_email" do
    it "assigns a new email_template as @email_template" do

      email_template = EmailTemplate.create! valid_email_template_attributes
      send_email = SendEmail.new valid_attributes
      send_email.email_template_id = email_template.id

      send_email_params = {
        email_template_id: send_email.email_template_id,
        filename: send_email.filename
      }
      post :send_email,   {send_email: send_email_params}  , valid_session

      MaloneMailer.any_instance.received_message? :welcome_email

    end
  end


end
