require 'spec_helper'

describe "commits/index.html.erb" do
  before(:each) do
    assign(:commits, [
      stub_model(Commit),
      stub_model(Commit)
    ])
  end

  it "renders a list of commits" do
    render
  end
end
