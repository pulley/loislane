require 'spec_helper'

describe "commits/show.html.erb" do
  before(:each) do
    @commit = assign(:commit, stub_model(Commit))
  end

  it "renders attributes in <p>" do
    render
  end
end
