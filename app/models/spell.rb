
class DescriptionValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank? || value.strip == "<p><br></p>"
      record.errors[attribute] << (options[:message] || "cannot be blank.") 
    end
  end
end



class Spell < ApplicationRecord
	META = ["id", "created_at", "updated_at", "ritual"]
	VALIDATED = Spell.attribute_names.reject{|attr| META.include?(attr)}

	validates_presence_of VALIDATED

	validates :description,
		description: true

	has_many :inscriptions
	has_many :spell_books, 
		:through => :inscriptions,
		:dependent => :destroy

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
			Divination
			Enchantment
			Evocation
			Illusion
			Necromancy
			Transmutation
		)
	end

	def self.casting_times
		[
			"Action",
			"Bonus Action",
			"Reaction",
			"1 minute"
		]
	end

	def self.ranges
		[
			"Self",
			"Self (15' cone)",
			"Touch",
			"10 feet",
			"30 feet",
			"60 feet",
			"90 feet",
			"120 feet",
			"150 feet"
		]
	end

	def self.durations
		[
			"Instantaneous",
			"1 round",
			"1 hour",
			"1 minute",
			"10 minutes",
			"Concentration, up to 1 round",
			"Concentration, up to 1 minute",
			"Concentration, up to 10 minutes",
			"Concentration, up to 1 hour",
			"Concentration, up to 8 hours",
			"8 hours",
			"24 hours",
			"10 days",
			"Until dispelled"
		]
	end

	def byline
		byline = ""
		if self[:level] == 0
			byline << self[:school] + " Cantrip"
		else
			byline << self[:level].ordinalize + "-level " + self[:school]
		end

		unless self[:ritual].nil? || self[:ritual] == false
			byline << " (ritual)"
		end
		byline
	end
end




