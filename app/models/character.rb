class Character < ApplicationRecord


	validates :name,
		:presence => true
	validates :level,
		:presence => true
	validates :character_class,
		:presence => true
	validates :race,
		:presence => true

	belongs_to :player
	has_many :spell_books,
		:dependent => :destroy
	has_many :trainings
	has_many :feats, 
		:through => :trainings,
		:dependent => :destroy


	def summary
		self[:level].ordinalize + ' level ' + self[:race] + ' ' + self[:character_class]
	end
end
