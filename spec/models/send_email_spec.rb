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

    it "responds to uploaded_file" do
      subject.respond_to?(:uploaded_file).should be true
    end

    it "responds to uploaded_file" do
      subject.respond_to?(:do_substitution).should be true
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

    it "validates when constructed with valid parameters" do
      send_email = SendEmail.new( valid_parameters)
      send_email.valid?.should eq true
    end

  end

  describe "functions" do

    it "#uploaded_file=" do
      send_email = SendEmail.new(valid_parameters)

      uploaded_file = mock(ActionDispatch::Http::UploadedFile).as_null_object
      uploaded_file.stub!(:original_filename).and_return('test.doc')
      uploaded_file.stub!(:read).and_return("Some content")

      send_email.uploaded_file=uploaded_file

      send_email.content_type.should_not be nil
    end
  end

end