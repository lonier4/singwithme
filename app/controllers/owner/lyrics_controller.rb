class Owner::LyricsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @lyrics = Lyric.all
    @lyrics = Lyric.order("title").page(params[:page]).per_page(6)
  end

  def new
    @lyric = Lyric.new
  end

  def create
    lyric_create_params = lyric_params
    lyric_create_params["video_url"] = generate_embeddable_video_url(lyric_params["video_url"])
    @lyric = current_user.lyrics.create(lyric_create_params)  
    redirect_to owner_lyric_path(@lyric)
  end

  def show
    @lyric = Lyric.find(params[:id])
  end

  def edit
    @lyric = Lyric.find(params[:id])
  end

  def destroy
    @lyric = Lyric.find(params[:id])
    @lyric.destroy
    redirect_to root_path
  end

  private

  def generate_embeddable_video_url(video_url)
    # input from the form
    # video_url = "https://www.youtube.com/watch?v=ZCEYsOqEz_U"
    uri    = URI.parse(video_url)
    params = CGI.parse(uri.query)
    # parse the query params to get the video id
    video_id = params['v'].first
    return "https://www.youtube.com/embed/#{video_id}"
  end

  def lyric_params
    params.require(:lyric).permit(:title, :artist, :video_url)
  end
end
