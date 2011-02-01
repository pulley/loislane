require 'spec_helper'

describe "approvals/index.html.erb" do
  before(:each) do
    assign(:approvals, [
      stub_model(Approval),
      stub_model(Approval)
    ])
  end

  it "renders a list of approvals" do
    render
  end
end
