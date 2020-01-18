class Owner::LyricsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @lyric = Lyric.new
  end

  def create
    @lyric = current_user.lyrics.create(lyric_params)
    redirect_to owner_lyric_path(@lyric)
  end

  def show
    @lyric = Lyric.find(params[:id])
  end

  private

  def lyric_params
    params.require(:lyric).permit(:title, :artist)
  end
end
