class VideosController < ApplicationController
  before_action :authenticate_user!

  def new
    @video = Video.new
  end
end
