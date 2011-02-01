require "spec_helper"

describe ApprovalsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/approvals" }.should route_to(:controller => "approvals", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/approvals/new" }.should route_to(:controller => "approvals", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/approvals/1" }.should route_to(:controller => "approvals", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/approvals/1/edit" }.should route_to(:controller => "approvals", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/approvals" }.should route_to(:controller => "approvals", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/approvals/1" }.should route_to(:controller => "approvals", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/approvals/1" }.should route_to(:controller => "approvals", :action => "destroy", :id => "1")
    end

  end
end
