class User < ApplicationRecord
  has_many :listings, class_name: 'Listing', foreign_key: 'seller_id'
	has_many :orders, class_name: 'Order', foreign_key: 'buyer_id'

  mount_uploader :avatar, PhotoUploader
#   validates :email, :uniqueness => true, :format => { :with => /.+@.{2,}\..+/ }, :allow_nil =>true
  
#   validates :name, :numericality => {:greater_than => 5}, :allow_nil =>true

# create_table "users", force: :cascade do |t|
#     t.string "name"
#     t.string "email"
#     t.string "hashed_password"
#     t.string "address"
#     t.string "avatar"
#     t.string "description"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false

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
