# == Schema Information
#
# Table name: reviews
#
#  id          :integer         not null, primary key
#  review_body :string(255)
#  rating      :float
#  helpfulness :integer
#  flag        :integer
#  created_at  :datetime
#  updated_at  :datetime
#  list_id     :integer
#  user_id     :integer
#

require 'spec_helper'

describe Review do

  before(:each) do
    @listing = Factory(:list)
    @user = Factory(:user)
    @attr = { :review_body => "value for content", :helpfulness => 1 }
    @attr2 = { :review_body => "value", :helpfulness => 0, :user_id => 1}
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
      @review = @user.reviews.create(@attr)
      @review.list_id = @listing.id
    end

    it "user should have a review attribute" do
      @user.should respond_to(:reviews)
    end
    
    it "listing should have a review attribute" do
      @listing.should respond_to(:reviews)
    end
  end
  
  
  describe "validations" do

    it "should require a user id" do
      Review.new(@attr).should_not be_valid
    end

    it "should require nonblank content" do
      @user.reviews.build(:review_body => "  ").should_not be_valid
    end

    it "should require a listing id" do
      Review.new(@attr2).should_not be_valid
    end
  end
  
  
  
  
end
