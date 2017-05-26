class Spell < ApplicationRecord
	META = ["id", "created_at", "updated_at"]
	VALIDATED = Spell.attribute_names.reject{|attr| META.include?(attr)}

	validates_presence_of VALIDATED
end
