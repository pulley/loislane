require 'spec_helper'

describe "approvals/show.html.erb" do
  before(:each) do
    @approval = assign(:approval, stub_model(Approval))
  end

  it "renders attributes in <p>" do
    render
  end
end
