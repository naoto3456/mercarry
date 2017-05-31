class ListingsController < ApplicationController
	def index
		# default path without searching
		if params[:categorory].nil? and params[:keyword].nil?
			@listings = Listing.all
		else
			# searching path
			@listings = Listing.by_category(params[:category]).by_keyword(params[:keyword])
		end
	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(listing_params)
		@listing.seller_id = view_context.current_user.id

		if @listing.save
			flash[:success] = "new listing has been created"
			redirect_to listing_path(@listing.id)
		else
			flash.now[:danger] = "[error] new listing has not been created"
			render :new
		end
	end

	def show
		@listing = Listing.find_by_id(params[:id])
		@order = Order.new
		@client_token = Braintree::ClientToken.generate
	end

	private
	def listing_params
				params.require(:listing).permit(:name, :description, :categoryl1_id, :categoryl2_id, :shipping_paid_by, :price, :photo)
	end
end
