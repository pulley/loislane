require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe ApprovalsController do

  def mock_approval(stubs={})
    @mock_approval ||= mock_model(Approval, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all approvals as @approvals" do
      Approval.stub(:all) { [mock_approval] }
      get :index
      assigns(:approvals).should eq([mock_approval])
    end
  end

  describe "GET show" do
    it "assigns the requested approval as @approval" do
      Approval.stub(:find).with("37") { mock_approval }
      get :show, :id => "37"
      assigns(:approval).should be(mock_approval)
    end
  end

  describe "GET new" do
    it "assigns a new approval as @approval" do
      Approval.stub(:new) { mock_approval }
      get :new
      assigns(:approval).should be(mock_approval)
    end
  end

  describe "GET edit" do
    it "assigns the requested approval as @approval" do
      Approval.stub(:find).with("37") { mock_approval }
      get :edit, :id => "37"
      assigns(:approval).should be(mock_approval)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created approval as @approval" do
        Approval.stub(:new).with({'these' => 'params'}) { mock_approval(:save => true) }
        post :create, :approval => {'these' => 'params'}
        assigns(:approval).should be(mock_approval)
      end

      it "redirects to the created approval" do
        Approval.stub(:new) { mock_approval(:save => true) }
        post :create, :approval => {}
        response.should redirect_to(approval_url(mock_approval))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved approval as @approval" do
        Approval.stub(:new).with({'these' => 'params'}) { mock_approval(:save => false) }
        post :create, :approval => {'these' => 'params'}
        assigns(:approval).should be(mock_approval)
      end

      it "re-renders the 'new' template" do
        Approval.stub(:new) { mock_approval(:save => false) }
        post :create, :approval => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested approval" do
        Approval.stub(:find).with("37") { mock_approval }
        mock_approval.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :approval => {'these' => 'params'}
      end

      it "assigns the requested approval as @approval" do
        Approval.stub(:find) { mock_approval(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:approval).should be(mock_approval)
      end

      it "redirects to the approval" do
        Approval.stub(:find) { mock_approval(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(approval_url(mock_approval))
      end
    end

    describe "with invalid params" do
      it "assigns the approval as @approval" do
        Approval.stub(:find) { mock_approval(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:approval).should be(mock_approval)
      end

      it "re-renders the 'edit' template" do
        Approval.stub(:find) { mock_approval(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested approval" do
      Approval.stub(:find).with("37") { mock_approval }
      mock_approval.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the approvals list" do
      Approval.stub(:find) { mock_approval }
      delete :destroy, :id => "1"
      response.should redirect_to(approvals_url)
    end
  end

end