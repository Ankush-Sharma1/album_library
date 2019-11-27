class Photo < ApplicationRecord
  # Associations
  belongs_to :album

  # Callbacks
  after_destroy :delete_dir

  private

  def delete_dir
    # photo_path=Rails.root.join("public", "uploads", "albums", @album.id.to_s, next_photo_id)
    # File.delete(photo_path)
    root_path = Rails.root.join("public").to_s
    this_dir = self.path.split("/")[0...-1].join("/")
    FileUtils.rm_rf("#{root_path}/#{this_dir}")
  end
end
