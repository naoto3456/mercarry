class ListingsController < ApplicationController
	def index
		@listings = Listing.all
	end

	def show
		@listing = Listing.find_by_id(params[:id])
		@order = Order.new
	end
end
