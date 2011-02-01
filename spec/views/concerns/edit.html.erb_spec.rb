require 'spec_helper'

describe "concerns/edit.html.erb" do
  before(:each) do
    @concern = assign(:concern, stub_model(Concern))
  end

  it "renders the edit concern form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => concern_path(@concern), :method => "post" do
    end
  end
end
