require "spec_helper"

describe CommitsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/commits" }.should route_to(:controller => "commits", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/commits/new" }.should route_to(:controller => "commits", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/commits/1" }.should route_to(:controller => "commits", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/commits/1/edit" }.should route_to(:controller => "commits", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/commits" }.should route_to(:controller => "commits", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/commits/1" }.should route_to(:controller => "commits", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/commits/1" }.should route_to(:controller => "commits", :action => "destroy", :id => "1")
    end

  end
end
