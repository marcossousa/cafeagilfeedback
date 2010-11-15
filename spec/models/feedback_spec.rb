require 'spec_helper'

describe Feedback do
  let(:feedback){ Factory.build(:feedback) }
  
  def validate_scope(type) 
    feedback.save!
    # create a bad feedback just for sure having one
    bad = Factory.build(:feedback)
    bad.feedback_type = "bad"
    bad.save!
    
    result = eval("Feedback.#{type}")
    result.each do |f|
      f.feedback_type.should == type
    end
  end
  
  context "valid data" do
    it "should validate presence of message" do
      feedback.message = nil
      feedback.should be_invalid
    end
    
    it "should validate presence of feedback type" do
      feedback.feedback_type = nil
      feedback.should be_invalid
    end
  end
  
  context "feedback type" do
    it "should fail with wrong type" do
      feedback.feedback_type = "foo"
      feedback.should be_invalid
    end
    
    it "should be valid with good" do
      feedback.feedback_type = "good"
      feedback.should be_valid
    end
    
    it "should be valid with bad" do
      feedback.feedback_type = "bad"
      feedback.should be_valid
    end
  end
  
  context "querying good feedbacks" do
    it "should retrieve only good feedbacks" do
      validate_scope("good")
    end
    
    it "should retrieve only bad feedbacks" do
      validate_scope("bad")
    end
  end
  
  context "default create date" do
    it "should generate a current date" do
      feedback.created_at.should be_nil
      feedback.save!
      feedback.created_at.should_not be_nil
    end
  end
  
end
