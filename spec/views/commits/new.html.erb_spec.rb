require 'spec_helper'

describe "commits/new.html.erb" do
  before(:each) do
    assign(:commit, stub_model(Commit).as_new_record)
  end

  it "renders new commit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => commits_path, :method => "post" do
    end
  end
end
