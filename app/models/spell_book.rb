class SpellBook < ApplicationRecord

	belongs_to :character

	validates :name,
		:presence => true,
		:uniqueness => {
			:scope => :player_id,
			:message => "must be unique"
		}

	scope :sorted_name, lambda { order("name ASC") }
end
