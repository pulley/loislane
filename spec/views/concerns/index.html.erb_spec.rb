require 'spec_helper'

describe "concerns/index.html.erb" do
  before(:each) do
    assign(:concerns, [
      stub_model(Concern),
      stub_model(Concern)
    ])
  end

  it "renders a list of concerns" do
    render
  end
end
