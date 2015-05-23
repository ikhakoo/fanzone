class EntriesController < ApplicationController

	def index
		@entries = Entry.all.paginate(page: params[:page])
		@comments = Comment.all
		@commentable = find_commentable
	end

end
