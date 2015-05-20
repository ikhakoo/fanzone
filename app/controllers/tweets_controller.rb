class TweetsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]

  def index
    if signed_in?
      @tweet = current_user.tweets.build
      @feed_items = Tweet.all.paginate(page: params[:page])
      render 'static_pages/home'
    elsif params[:tag]
      @tweets = Tweet.tagged_with(params[:tag])
    end
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      flash[:success] = 'Post created!'
      redirect_to root_url
    else
      flash[:danger] = @tweet.errors.full_messages.to_sentence
      redirect_to root_url
    end
  end

  def destroy
    @tweet.destroy
    redirect_to root_url
  end

  private

    def tweet_params
      params.require(:tweet).permit(:content, :tweet_id)
    end

    def correct_user
      @tweet = current_user.tweets.find_by(id: params[:id])
      redirect_to root_url if @tweet.nil?
    end

end

