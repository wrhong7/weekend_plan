class Map < ActiveRecord::Base

	belongs_to :recommendation

	geocoded_by :address
	after_validation :geocode

end
