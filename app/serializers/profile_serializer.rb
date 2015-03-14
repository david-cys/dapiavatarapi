class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :display_name, :email, :description
end

