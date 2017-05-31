class ListingsController < ApplicationController
	def index
		@listings = Listing.all
	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(listing_params)
		@listing.seller_id = view_context.current_user.id

		if @listing.save
			flash[:notice] = "new listing has been created"
			byebug
			redirect_to listing_path(@listing.id)
		else
			flash.now[:notice] = "[error] new listing has not been created"
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
