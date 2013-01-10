require 'spec_helper'

describe SessionsController do

  it "logs in permanently" do
    FactoryGirl.create(:person, password: "password", password_confirmation: "password")
    post :create, session: { email: Person.last.email, password: "password", remember_me: "1" }
    response.headers["Set-Cookie"].should include(Person.last.auth_token)
    cookies[:auth_token].should eq Person.last.auth_token
  end

end
