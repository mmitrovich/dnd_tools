class CharacterClass < ApplicationRecord

	validates :name,
		:presence => true,
		:uniqueness => true
end
