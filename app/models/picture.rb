class Picture < ActiveRecord::Base
  belongs_to :product
  attr_accessible :image, :token

  mount_uploader :image, ImageUploader

  def to_jq_upload
    {
      "name" => read_attribute(:image),
      "size" => image.size,
      "url" => image.url,
      "thumbnail_url" => image.url(:thumb),
      "delete_url" => id,
      "delete_type" => "delete"
    }
  end
end
