class CommentsController < ApplicationController

	def new
    @tweet = load_tweet
    @comment = @tweet.comments.build
  end

  def create
    @tweet = load_tweet
    @comment = @tweet.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to tweet_path(@tweet.id), notice: 'Comment created successfully' 
        end
        format.js
      else
        format.html { render 'tweets/show', alert: 'There was an error' }
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :tweet_id, :user_id)
  end

  def load_tweet
    @tweet = Tweet.find(params[:tweet_id])
end
