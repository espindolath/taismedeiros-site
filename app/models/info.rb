class Info < ApplicationRecord
	mount_uploader :photo, GalleryUploader
	mount_uploader :logo, GalleryUploader
end
