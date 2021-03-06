module TweetsHelper

	def tag_links(tags)
  	tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip) }.join(", ") 
	end

	# def tag_cloud(tags, classes)
	#   max = tags.sort_by(&:count).last
	#   tags.each do |tag|
	#     index = tag.count.to_f / max.count * (classes.size-1)
	#     yield(tag, classes[index.round])
	#   end
 #  end

  def wrap(content)
    sanitize(raw(content.split.map { |s| wrap_long_string(s) }.join(' ')))
  end

  private

    def wrap_long_string(text, max_width = 65)
      zero_width_space = "&#8203;"
      regex = /.{1,#{max_width}}/
      (text.length < max_width) ? text : text.scan(regex).join(zero_width_space)
    end
end
