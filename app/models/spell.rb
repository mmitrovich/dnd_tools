
class DescriptionValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank? || value.strip == "<p><br></p>"
      record.errors[attribute] << (options[:message] || "cannot be blank.") 
    end
  end
end



class Spell < ApplicationRecord
	META = ["id", "created_at", "updated_at"]
	VALIDATED = Spell.attribute_names.reject{|attr| META.include?(attr)}

	validates_presence_of VALIDATED

	validates :description,
		description: true

	has_many :inscriptions
	has_many :spell_books, 
		:through => :inscriptions

	scope :sorted_name, lambda { order("name ASC") }
	scope :sorted_level, lambda { order("level ASC name ASC") }



	def level_display
		if self[:level] == 0
			"Cantrip"
		else
			self[:level].ordinalize
		end
	end

	def self.schools
		%w(
			Abjuration
			Conjuration
			Evocation
		)
	end

	def byline
		if self[:level] == 0
			self[:school] + " Cantrip"
		else
			self[:level].ordinalize + "-level " + self[:school]
		end
	end
end




