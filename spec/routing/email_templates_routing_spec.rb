require "spec_helper"

describe EmailTemplatesController do
  describe "routing" do

    it "routes to #index" do
      get("/email_templates").should route_to("email_templates#index")
    end

    it "routes to #new" do
      get("/email_templates/new").should route_to("email_templates#new")
    end

    it "routes to #show" do
      get("/email_templates/1").should route_to("email_templates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/email_templates/1/edit").should route_to("email_templates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/email_templates").should route_to("email_templates#create")
    end

    it "routes to #update" do
      put("/email_templates/1").should route_to("email_templates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/email_templates/1").should route_to("email_templates#destroy", :id => "1")
    end

  end
end
