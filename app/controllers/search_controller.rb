class SearchController < ApplicationController

 	def index
	  @entries = Entry.where("LOWER(title) LIKE LOWER(?)", "%#{params[:search]}%").paginate(page: params[:page])
	  @videos  = Video.where("LOWER(title) LIKE LOWER(?)", "%#{params[:search]}%").paginate(page: params[:page])
	  @tweets  = Tweet.where("LOWER(content) LIKE LOWER(?)", "%#{params[:search]}%").paginate(page: params[:page])
	end

end
