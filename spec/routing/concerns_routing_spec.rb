require "spec_helper"

describe ConcernsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/concerns" }.should route_to(:controller => "concerns", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/concerns/new" }.should route_to(:controller => "concerns", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/concerns/1" }.should route_to(:controller => "concerns", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/concerns/1/edit" }.should route_to(:controller => "concerns", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/concerns" }.should route_to(:controller => "concerns", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/concerns/1" }.should route_to(:controller => "concerns", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/concerns/1" }.should route_to(:controller => "concerns", :action => "destroy", :id => "1")
    end

  end
end
