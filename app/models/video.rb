class Video < ActiveRecord::Base

	has_many :comments, :as => :commentable
	belongs_to :user

	def youtube_id
		if url =~ /https?:\/\/(?:(?:www\.)?youtube\.com\/watch\?v=|youtu\.be\/)(.+)/
			$1
		end
	end

end
