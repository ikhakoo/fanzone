class SearchController < ApplicationController

 	def index
    @entries 	= Entry.where("LOWER(title) LIKE LOWER(?)", "%#{params[:search]}%")
    @videos 	= Video.where("LOWER(title) LIKE LOWER(?)", "%#{params[:search]}%")
    @tweets 	= Tweet.where("LOWER(content) LIKE LOWER(?)", "%#{params[:search]}%")
	end

end
