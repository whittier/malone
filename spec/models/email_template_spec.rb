require 'spec_helper'

describe EmailTemplate do
  describe "Validations" do
    it "has a valid factory" do
      FactoryGirl.create(:email_template).should be_valid
    end

    it "fails if name" do
      FactoryGirl.build(:email_template, name: nil).should_not be_valid
    end

    it "fails if subject is blank" do
      FactoryGirl.build(:email_template, subject: nil).should_not be_valid
    end

    it "fails if body is blank" do
      FactoryGirl.build(:email_template, body: nil).should_not be_valid
    end

  end
end
