class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = find_id
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(sub_params)
      if @song.save
        redirect_to song_path(@song.id)
      else
        render 'new'
      end
  end

  def edit
    @song = find_id
  end

  def update
    @song = find_id
      if @song.update(sub_params)
        redirect_to song_path(@song.id)
      else
        render 'edit'
      end
  end

  def destroy
    @song = find_id
     @song.destroy
      redirect_to songs_path
  end

  private

  def sub_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

  def find_id
    Song.find(params[:id])
  end


end # end class
