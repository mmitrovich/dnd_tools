class Training < ApplicationRecord
	belongs_to :character
	belongs_to :feat

	validates :custom_uses_count,
		:numericality => true,
		:allow_blank => true
end
