class Categoryl2 < ApplicationRecord
	belongs_to :categoryl1
	has_many :listings
end
