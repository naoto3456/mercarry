class OrdersController < ApplicationController

	def create

		order = Order.new(listing_id: params[:listing_id], buyer_id: view_context.current_user.id, ordered_at: Time.now, status)

		nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

	  result = Braintree::Transaction.sale(
	   :amount => order.listing.price, #this is currently hardcoded
	   :payment_method_nonce => nonce_from_the_client,
	   :options => {
	      :submit_for_settlement => true
	    }
	   )

		if order.save
			flash[:success] = "your order succeed."
			redirect_to listing_path(params[:listing_id])
		else
			flash.now[:danger] = "your order failed."
			render listing_path(params[:listing_id])			
		end

	end


	# private
	# def order_params
	# 	#params.require(:order).permit(:listing_id)
	# end
end
