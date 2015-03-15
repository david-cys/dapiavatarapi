class Avatar < ActiveRecord::Base
  has_attached_file :image,
    :styles => { :medium => "1024x1024>", :thumb => "100x100>" },
    :convert_options => { :medium => "-gravity center -extent 1024x1024",
                          :thumb => "-gravity center -extent 100x100" }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :profile_uuid

end

