class VideosController < ApplicationController
  before_action :authenticate_user!
  

  def index
    @videos = Video.all
    @videos = Video.order("title").page(params[:page]).per_page(6)
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
   
  end

  private

  helper_method :current_user_video
  def current_user_video
    @current_user_video ||= Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :artist, :image, :video)
  end

end
