class Player < ApplicationRecord

	scope :sorted, lambda { order("name ASC") }
end
