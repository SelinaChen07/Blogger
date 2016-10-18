class Article < ApplicationRecord
	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings

	#Add attribute tag_list which is an array storing tag names, such as ["ruby", "rails", "web development"]
	def tag_list	#Reading function to read the attribute tag_list in Article class
		self.tags.collect do |tag| 
			tag.name
		end.join(", ")
	end

	def tag_list=(tag_string)	#Writing function to write the attribute tag_list in Article class
		tags_name = tag_string.split(",").collect{|t| t.strip.downcase}.uniq
		new_or_found_tags = tags_name.collect{|tag_name| Tag.find_or_create_by(name: tag_name)}
		self.tags = new_or_found_tags
	end

end


