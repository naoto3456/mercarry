class Categoryl1 < ApplicationRecord
	has_many :categoryl2s
	has_many :listings	
end
