class ReviewsController < ApplicationController
	
	def index
	     @reviews = Review.all
	end 


	def show
	     @review = Review.find(params[:id])
	end


	def new	 	     
	     @review = Review.new
	     @show = Show.find(params[:show_id])	 
	end


	def create		
	     @show = Show.find(params[:show_id])
	     @review = Review.new(review_params)
		if @review.save
		    redirect_to show_path(@show.id)
		else
		     @message = @review.errors.messages
		    render :new	
		end 
	end


	def edit
	     @show = Show.find(params[:show_id])
	     @review = Review.find(params[:id])
	end

	
	def update
		 @show = Show.find(params[:show_id])
		@review = Review.find(params[:id])
		if @review.update(review_params)
			redirect_to show_path(@show.id)
		else
			@message = @review.errors.messages
			render :edit
		end
	end


	def destroy
		@show = Show.find(params[:show_id])
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to show_path(@show.id)
	end


	def review_params
	     params.require(:review).permit!
	end
end
