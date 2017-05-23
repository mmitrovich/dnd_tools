class Player < ApplicationRecord

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates :name,
		:presence => true,
		:uniqueness => true

	validates :email,
		:uniqueness => true,
		:format => EMAIL_REGEX,
		:allow_blank => true


	scope :sorted, lambda { order("name ASC") }
end
