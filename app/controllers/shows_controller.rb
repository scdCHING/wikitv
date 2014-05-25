class ShowsController < ApplicationController
	def index
		@shows = Show.all
	end

	def new
		@show = Show.new		
	end

	def create
		@show = Show.new(show_params)					
		if @show.save
			redirect_to show_path(@show.id)
		else
			@message = @show.errors.messages
			render :new
		end
	end

	def edit
		@show = Show.find(params[:id])
	end

	def update
		@show = Show.find(params[:id])		
		if @show.update(show_params)
			redirect_to show_path
		else
			@message = @show.errors.messages
			render :edit
		end
	end

	def show
		@show = Show.find(params[:id])
		@reviews = Review.all
				
	end

	def destroy
		@show = Show.find(params[:id])
		@show.destroy
		redirect_to shows_path
	end

	def show_params
		params.require(:show).permit!
	end

end
