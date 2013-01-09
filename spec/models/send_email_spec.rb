require 'spec_helper'

describe SendEmail do

  def valid_parameters
    {
        filename: "thefilename",
        email_template_id: "0"
    }
  end

  describe "data structure" do
    it "is non persistent" do
      subject.persisted?.should be false
    end

    it "responds to filename" do
      subject.respond_to?(:filename).should be true
    end

    it "responds to email_template_id" do
      subject.respond_to?(:email_template_id).should be true
    end
  end

  describe "validations" do

    it "has a valid factory" do
      FactoryGirl.build(:send_email).should be_valid
    end

    it "fails validation if length of filename < 1" do
      send_email = SendEmail.new( {filename: "", email_template_id: 0})
      send_email.valid?.should eq false
    end

    it "fails validation if length of filename > 500" do
      filename = "1"*501
      send_email = SendEmail.new( {filename: filename, email_template_id: 0})
      send_email.valid?.should eq false
    end

    it "validates when constucted with valid parameters" do
      send_email = SendEmail.new( valid_parameters)
      send_email.valid?.should eq true
    end

  end

end