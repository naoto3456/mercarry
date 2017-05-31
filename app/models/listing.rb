class Listing < ApplicationRecord
	belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
	belongs_to :categoryl1
	belongs_to :categoryl2

	enum condition:[:like_new, :good, :fair, :poor]
	enum shipping_paid_by:[:buyer, :seller, :undecided]
	enum status:[:on_sale, :sold_out, :not_available]

	mount_uploader :photo, PhotoUploader

	scope :by_category, ->(category) {  where(" categoryl1_id = ?" , category ) if !category.nil? and !category.empty? }
	#scope :by_keyword, ->(keyword) { where(" name like %?%" , keyword ) if !keyword.nil? }
	scope :by_keyword, ->(keyword) { where(" name = ?" , keyword ) if !keyword.nil? and !keyword.empty? }

end
