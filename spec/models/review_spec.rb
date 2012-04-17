require 'spec_helper'

describe Review do

  before(:each) do
    @listing = Factory(:list)
    @user = Factory(:user)
    @attr = { :review_body => "value for content", :helpfulness => 1 }
  end

  it "should create a new instance given valid attributes" do
    @review = @user.reviews.build(@attr)
    @review.list_id = @listing.id
  end

  describe "user associations" do

    before(:each) do
      @review = @user.reviews.create(@attr)
      @review.list_id = @listing.id
    end

    it "should have a user attribute" do
      @review.should respond_to(:user_id)
    end

    it "should have the right associated user" do
      @review.user_id.should == @user.id
      @review.user.should == @user
    end
    
    it "should have the right associated listing" do
      @review.list_id.should == @listing.id
    end
  end
  
  
  describe "review associations" do

    before(:each) do
      @mp1 = Factory(:review, :user => @user, :list => @listing, :created_at => 1.day.ago)
      @mp2 = Factory(:review, :user => @user, :list => @listing, :created_at => 1.hour.ago)
    end

    it "should have a reviews attribute" do
      @user.should respond_to(:reviews)
    end
    
    it "should have a reviews attribute" do
      @listing.should respond_to(:reviews)
    end

    it "should have the right microposts in the right order" do
      @user.reviews.should == [@mp2, @mp1]
    end
  end
  
  
end
