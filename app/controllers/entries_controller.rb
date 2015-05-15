class EntriesController < ApplicationController

	def index
		@entries = Entry.all
		@comments = Comment.all
		@commentable = find_commentable
	end

end
