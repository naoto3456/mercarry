class User < ApplicationRecord
  has_many :listings, class_name: 'Listing', foreign_key: 'seller_id'
	has_many :orders, class_name: 'Order', foreign_key: 'buyer_id'

  mount_uploader :avatar, PhotoUploader

  include BCrypt

	def password
		if hashed_password.nil?
			@password = ''
    else
    	@password ||= Password.new(hashed_password)    	
    end
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end
end
