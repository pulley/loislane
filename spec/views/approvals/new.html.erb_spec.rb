require 'spec_helper'

describe "approvals/new.html.erb" do
  before(:each) do
    assign(:approval, stub_model(Approval).as_new_record)
  end

  it "renders new approval form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => approvals_path, :method => "post" do
    end
  end
end
