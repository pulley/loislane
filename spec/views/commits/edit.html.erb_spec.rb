require 'spec_helper'

describe "commits/edit.html.erb" do
  before(:each) do
    @commit = assign(:commit, stub_model(Commit))
  end

  it "renders the edit commit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => commit_path(@commit), :method => "post" do
    end
  end
end
