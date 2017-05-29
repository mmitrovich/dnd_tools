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

	validates :name,
		:existence => true,
		:uniqueness => true
	validates :desription,
		:existence => true
	validates :type,
		:existence => true

	scope :sorted, lambda { order("type ASC, name ASC") }

end
