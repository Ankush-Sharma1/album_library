class AlbumsController < ApplicationController
  before_action :authenticate_user!
  def index
    @albums=current_user.albums
  end

  def new
    @album=Album.new
  end

  def show
    @album=Album.find(params[:id])
    # @photo = @album.photos.build
    @photos = @album.photos.order(created_at: :desc)
  end

  def edit
    @album=Album.find(params[:id])
  end

  def create
    @album=current_user.albums.build(album_params)
    if @album.save
      redirect_to @album
    else
      render 'new'
    end
  end

  def update
    @album=Album.find(params[:id])
    if @album.update(album_params)
      redirect_to @album
    else
      render 'edit'
    end
  end

  def destroy
    @album=Album.find(params[:id])
    @album.destroy

    redirect_to albums_path
  end
  private
  def album_params
  params.require(:album).permit(:title, :description)
  end
end
