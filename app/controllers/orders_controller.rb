class OrdersController < ApplicationController

	def create
		order = Order.new(listing_id: params[:listing_id], buyer_id: view_context.current_user.id, ordered_at: Time.now)
		order.save
	end


	# private
	# def order_params
	# 	#params.require(:order).permit(:listing_id)
	# end
end
