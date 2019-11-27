class PhotosController < ApplicationController
  before_action :set_album
  def index
    @photos=Photo.all
  end

  def show
  end

  def new
    @photo=Photo.new
  end

  def edit
  end

  def create
    files = params[:files]
    @errors = []
    files.each_with_index do |file, index|
      file_name = file.try(:original_filename)
      file_name_to_save = file_name.to_s.downcase.gsub(" ", "_")
      photo = @album.photos.build(name: file_name)
      next_photo_id = (@album.photos.order(id: :desc).try(:first).try(:id).to_i + 1).to_s
      path = Rails.root.join("public", "uploads", "albums", @album.id.to_s, next_photo_id)
      file_path = path.join(file_name_to_save)
      # path =  "#{Rails.root}/public/uploads/albums/#{@album.id}/photos/#{next_photo_id}"
      FileUtils.mkdir_p(path) unless File.exist?(path)
      File.open(file_path, 'wb') do |f|
        f.write(file.read)
      end
      photo.path = file_path.to_s.gsub(Rails.root.join("public").to_s, "")
      photo.save if File.exist?(file_path) && File.size(file_path) > 0
    end if (files.present? and files.count > 0)
    #  uploaded_file=params[:files]
    #  File.open(Rails.root.join('app', 'assets',
    #  uploaded_file.original_filename), 'wb') do |file|
    #   file.write(uploaded_file.read)
    # end
    redirect_to album_path(@album)
  end

  def destroy
    @photo=@album.photos.find(params[:id])
    if @photo.destroy
      flash[:notice]= "Photo is deleted successfully."
    else
      flash[:error]= "There is an error to delete photo"
    end
     redirect_to albums_path
  end

  private
  def set_album
    @album = Album.find(params[:album_id])
  end
end

# remove_image_at_index(params[:id].to_i)
#     flash[:error] = "Failed deleting image" unless @gallery.save