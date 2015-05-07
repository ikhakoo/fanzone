class VideosController < ApplicationController

	def index

	end

  def show
    @videos = Video.all
  end

	def new
    @video = Video.new
  end

  def create
    # make a new video with what video_params returns (which is a method we're calling)
    @video = Video.new(video_params)
    if @video.save
      # if the save for the video was successful, go to index.html.erb
      redirect_to videos_url
    else
      # otherwise render the view associated with the action :new (i.e. new.html.erb)
      render :new
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])

    if @video.update_attributes(video_params)
      redirect_to "/videos"
    else
      render :edit
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to videos_url
  end

  private
  def video_params
    params.require(:video).permit(:source, :title, :url)
  end
end
