class TweetsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]

  def index
    @tweet = current_user.tweets.build if signed_in?
    @feed_items = Tweet.all.paginate(page: params[:page])
    render 'static_pages/home'
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
      params.require(:tweet).permit(:content)
    end

    def correct_user
      @tweet = current_user.tweets.find_by(id: params[:id])
      redirect_to root_url if @tweet.nil?
    end

end

