class PostImage < ApplicationRecord
	mount_uploader :image, ImageUploader
	mount_uploader :picture, PictureUploader

end
