class VideosController < ApplicationController
  before_action :authenticate_user!

  def index
    
  end
  
  def new
    @video = Video.new
  end

  def create
    @video = current_user.videos.create(video_params)
    if @video.valid?
      redirect_to video_path(@video)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @video = Video.find(params[:id])
  end

  private

  def video_params
    params.require(:video).permit(:title, :artist)
  end

end
