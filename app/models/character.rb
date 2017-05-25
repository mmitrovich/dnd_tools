class Character < ApplicationRecord


	has_one :character_class

	validates :name,
		:presence => true
	validates :level,
		:presence => true

	belongs_to :player
end
