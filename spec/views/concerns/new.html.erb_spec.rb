require 'spec_helper'

describe "concerns/new.html.erb" do
  before(:each) do
    assign(:concern, stub_model(Concern).as_new_record)
  end

  it "renders new concern form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => concerns_path, :method => "post" do
    end
  end
end
