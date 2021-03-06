class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @tweet  = current_user.tweets.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def about
  end

  def social
    @tweet = current_user.tweets.build
    @feed_items = Tweet.all
    @user = current_user
    @videos = Video.all
    @entries = Entry.all
  end
  
end
