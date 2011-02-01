require 'spec_helper'

describe "approvals/edit.html.erb" do
  before(:each) do
    @approval = assign(:approval, stub_model(Approval))
  end

  it "renders the edit approval form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => approval_path(@approval), :method => "post" do
    end
  end
end
