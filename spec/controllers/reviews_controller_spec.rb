require 'spec_helper'

describe ReviewsController do
  render_views


  #The following two tests are not working, for whatever reason
  describe "access control" do

    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end

    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(signin_path)
    end
  end
  
  
  describe "POST 'create'" do

    before(:each) do
      @user = test_sign_in(Factory(:user))
      @listing = Factory(:list)
    end

    describe "failure" do

      before(:each) do
        @attr = { :review_body => "" }
      end

      it "should not create a review" do
        lambda do
          post :create, :review => @attr, :list_id => @listing.id
        end.should_not change(Review, :count)
      end

      it "should render the home page" do
        post :create, :review => @attr, :list_id => @listing.id
        response.should render_template(@listing)
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :review_body => "Lorem ipsum" }
      end

      it "should create a review" do
        lambda do
          post :create, :review => @attr, :list_id => @listing.id
        end.should change(Review, :count).by(1)
      end

      it "should redirect to the listing page" do
        post :create, :review => @attr, :list_id => @listing.id
        response.should redirect_to(@listing)
      end

      it "should have a flash message" do
        post :create, :review => @attr, :list_id => @listing.id
        flash[:success].should =~ /Review created/i
      end
    end
  end
end