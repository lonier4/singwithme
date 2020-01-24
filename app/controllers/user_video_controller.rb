class UserVideoController < ApplicationController
  def index
    @videos = UserVideo.all
  end
end
