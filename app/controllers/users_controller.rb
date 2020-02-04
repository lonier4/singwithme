class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @lyric = Lyric.find(params[:id])
  end

end
