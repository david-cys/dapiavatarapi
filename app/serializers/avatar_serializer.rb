class AvatarSerializer < ActiveModel::Serializer
  attributes :id, :profile_uuid, :image_url_medium, :image_url_thumb, :created_at

  def image_url_medium
    object.image.url(:medium)
  end

  def image_url_thumb
    object.image.url(:thumb)
  end
end

