require 'spec_helper'

describe FeedbacksController do

  def mock_feedback(stubs={})
    (@mock_feedback ||= mock_model(Feedback).as_null_object).tap do |feedback|
      feedback.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET new" do
    it "assigns a new feedback as @feedback" do
      Feedback.stub(:new) { mock_feedback }
      get :new
      assigns(:feedback).should be(mock_feedback)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created feedback as @feedback" do
        Feedback.stub(:new).with({'these' => 'params'}) { mock_feedback(:save => true) }
        post :create, :feedback => {'these' => 'params'}
        assigns(:feedback).should be(mock_feedback)
      end

      it "redirects to the index page" do
        Feedback.stub(:new) { mock_feedback(:save => true) }
        post :create, :feedback => {}
        response.should redirect_to(root_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved feedback as @feedback" do
        Feedback.stub(:new).with({'these' => 'params'}) { mock_feedback(:save => false) }
        post :create, :feedback => {'these' => 'params'}
        assigns(:feedback).should be(mock_feedback)
      end

      it "re-renders the empty template" do
        Feedback.stub(:new) { mock_feedback(:save => false) }
        post :create, :feedback => {}
        response.should render_template()
      end
    end
  end
end
