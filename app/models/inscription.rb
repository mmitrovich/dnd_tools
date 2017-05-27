class Inscription < ApplicationRecord

	has_many :spells
	has_many :spell_books

	validates :spell_id, :spell_book_id,
		:presence => :true

	validates :uses,
		:only_integer => true
	end
end
