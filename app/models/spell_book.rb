class SpellBook < ApplicationRecord

	belongs_to :character
	has_many :inscriptions,
		:dependent => :destroy

	validates :name,
		:presence => true,
		:uniqueness => {
			:scope => :character_id,
			:message => "must be unique"
		}

	scope :sorted_name, lambda { order("name ASC") }
end
