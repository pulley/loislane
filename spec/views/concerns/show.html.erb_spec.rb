require 'spec_helper'

describe "concerns/show.html.erb" do
  before(:each) do
    @concern = assign(:concern, stub_model(Concern))
  end

  it "renders attributes in <p>" do
    render
  end
end
