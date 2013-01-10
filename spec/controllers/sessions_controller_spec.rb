require 'spec_helper'

describe SessionsController do

  it "logs in permanently" do
    FactoryGirl.create(:person, password: "password", password_confirmation: "password")
    post :create, session: { email: Person.last.email, password: "password", remember_me: "1" }
    response.headers["Set-Cookie"].should include(Person.last.auth_token)
    cookies[:auth_token].should eq Person.last.auth_token
  end

  it "logs in and puts the auth_token in the cookie" do
    FactoryGirl.create(:person, password: "password", password_confirmation: "password")
    post :create, session: { email: Person.last.email, password: "password", remember_me: "0" }
    response.headers["Set-Cookie"].should include(Person.last.auth_token)
    cookies[:auth_token].should eq Person.last.auth_token
  end

  it "does not login the user didn't supply a password" do
    FactoryGirl.create(:person, password: "password", password_confirmation: "password")
    post :create, session: { email: Person.last.email, password: "", remember_me: "0" }
    response.headers["Set-Cookie"].should eq nil
    flash[:error].should =~ /There was a problem with the email or password that you entered/i
  end

  it "logs out" do
    FactoryGirl.create(:person, password: "password", password_confirmation: "password")
    post :create, session: { email: Person.last.email, password: "password", remember_me: "0" }
    response.headers["Set-Cookie"].should include(Person.last.auth_token)
    cookies[:auth_token].should eq Person.last.auth_token

    post :destroy
    flash[:info].should =~ /You logged out successfully!/i
  end

end
