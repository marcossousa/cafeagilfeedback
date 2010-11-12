require "spec_helper"

describe FeedbacksController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/feedbacks" }.should route_to(:controller => "feedbacks", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/feedbacks/new" }.should route_to(:controller => "feedbacks", :action => "new")
    end

    it "should not recognize #show action" do
      { :get => "/feedbacks/1" }.should_not be_routable
    end

    it "should not recognize #edit action" do
      { :get => "/feedbacks/1/edit" }.should_not be_routable
    end

    it "recognizes and generates #create" do
      { :post => "/feedbacks" }.should route_to(:controller => "feedbacks", :action => "create")
    end

    it "should not recognize #update action" do
      { :put => "/feedbacks/1" }.should_not be_routable
    end

    it "should not recognize #destroy action" do
      { :delete => "/feedbacks/1" }.should_not be_routable
    end

  end
end
