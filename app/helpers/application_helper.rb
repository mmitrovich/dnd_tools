module ApplicationHelper

	def error_messages_for(object)
		render(:partial => 'application/error_messages', :locals => {:object => object})
	end

	def html_description(html_text)
		if html_text
			raw sanitize html_text, tags: %w(strong em br p ul ol li), attributes: %w(href)
		else
			false
		end
	end
end
