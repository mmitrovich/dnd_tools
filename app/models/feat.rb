class DescriptionValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank? || value.strip == "<p><br></p>"
      record.errors[attribute] << (options[:message] || "cannot be blank.") 
    end
  end
end


class Feat < ApplicationRecord

	META = ["id", "created_at", "updated_at"]
	VALIDATED = Feat.attribute_names.reject{|attr| META.include?(attr)}

	validates_presence_of VALIDATED

	validates :name,
		:uniqueness => true

	has_many :trainings
	has_many :characters, 
		:through => :trainings,
		:dependent => :destroy

	scope :sorted_type, lambda { order("use_type ASC, name ASC") }
	scope :sorted, lambda { order("name ASC") }

end
