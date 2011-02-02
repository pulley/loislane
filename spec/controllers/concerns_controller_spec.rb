require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe ConcernsController do

  def mock_concern(stubs={})
    @mock_concern ||= mock_model(Concern, stubs).as_null_object
  end

  describe "GET new" do
    it "assigns a new concern as @concern" do
      Concern.stub(:new) { mock_concern }
      get :new
      assigns(:concern).should be(mock_concern)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created concern as @concern" do
        Concern.stub(:new).with({'these' => 'params'}) { mock_concern(:save => true) }
        post :create, :concern => {'these' => 'params'}
        assigns(:concern).should be(mock_concern)
      end

      it "redirects to the created concern" do
        Concern.stub(:new) { mock_concern(:save => true) }
        post :create, :concern => {}
        response.should redirect_to(concern_url(mock_concern))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved concern as @concern" do
        Concern.stub(:new).with({'these' => 'params'}) { mock_concern(:save => false) }
        post :create, :concern => {'these' => 'params'}
        assigns(:concern).should be(mock_concern)
      end

      it "re-renders the 'new' template" do
        Concern.stub(:new) { mock_concern(:save => false) }
        post :create, :concern => {}
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested concern" do
      Concern.stub(:find).with("37") { mock_concern }
      mock_concern.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the concerns list" do
      Concern.stub(:find) { mock_concern }
      delete :destroy, :id => "1"
      response.should redirect_to(concerns_url)
    end
  end

end
