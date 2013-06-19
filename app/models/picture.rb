class Picture < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  attr_accessible :image
  mount_uploader :image, ImageUploader

  def to_jq_upload
    {
      "name" => read_attribute(:image),
      "size" => image.size,
      "url" => image.url,
      "thumbnail_url" => image.url(:thumb),
      "delete_url" => picture_path(self),
      "delete_type" => "delete"
    }
  end
end
