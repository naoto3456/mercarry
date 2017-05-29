class OrdersController < ApplicationController

	def create
		order = Order.new(listing_id: params[:listing_id], buyer_id: view_context.current_user.id, ordered_at: Time.now)
		
		if order.save
			flash[:notice] = "your order succeed."
			redirect_to listing_path(params[:listing_id])
		else
			flash.now[:notice] = "your order failed."
			render listing_path(params[:listing_id])			
		end
	end


	# private
	# def order_params
	# 	#params.require(:order).permit(:listing_id)
	# end
end
