class ReviewsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  
  
  def index
    
  end
  
 
  #TODO: Fix what the redirects are in these cases
  def create
    #listing = get_listing()
    @listing = List.find(params[:list_id])
    #@user = current_user
    @review = current_user.reviews.build(params[:review])
    @review.list_id = @listing.id
    #@review = @listing.reviews.build(params[:review])
    #@review.update_attributes(:user_id => @user)
    
    if (@review.save)
      flash[:success] = "Review created!"
      #format.html { redirect_to(@listing, :notice => 'Review was successfully created.') }
      #format.xml  { render :xml => @listing, :status => :created, :location => @listing }
      redirect_to @listing
    else 
      flash[:error] = "The review could not be created because there were some errors.........."
      puts @review.errors
      redirect_to @listing
      #render 'lists/1/show'
    end
  end
	#@review = Review.new(params[:list])
	
#	respond_to do |format|
    #  if (@review.valid?)
   #     @review.save
  #      format.html { redirect_to(@list, :notice => 'Review was successfully created.') }
 #       format.xml  { render :xml => @list, :status => :created, :location => @review }
 #     else
  #      puts;
    #  end
 #   end

  def update
	@review = Review.find(params[:id])
	
	respond_to do |format|
      if (@review.valid?)
	      @review.update_attributes(params[:list])
			  format.html { redirect_to(@list, :notice => 'Review was successfully updated.') }
			  format.xml  { head :ok }
		  else
		    puts;
		  end
    end
  end
		

  def destroy
	@review = Review.find(params[:id])
	@review.destroy
  end

end