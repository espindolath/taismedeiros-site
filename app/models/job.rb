class Job < ApplicationRecord
	mount_uploaders :images, GalleryUploader
	mount_uploaders :covers, GalleryUploader
end
