class Photo < ActiveRecord::Base
  belongs_to :album

  mount_uploader :file, FileUploader

  def name
    file.to_s.match(/\/uploads\/(.+)\..+/).captures[0]
  end 

  def thumbnail
    image = MiniMagick::Image.open("public" + file.to_s)
    image.resize("100x100")
    path = "/thumbnails/" + name + ".jpg"
    image.write("public" + path)
    path
  end
end
