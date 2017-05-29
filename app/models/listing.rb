class Listing < ApplicationRecord
	belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
	belongs_to :categoryl1
	belongs_to :categoryl2
end
