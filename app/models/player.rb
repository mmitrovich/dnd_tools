class Player < ApplicationRecord


	validates :name,
		:presence => true,
		:uniqueness => true

	scope :sorted, lambda { order("name ASC") }
end
