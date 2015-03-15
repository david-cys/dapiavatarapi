class Avatar < ActiveRecord::Base
  has_attached_file :image,
    :styles => { :medium => "1024x1024>", :thumb => "100x100>" },
    :convert_options => { :medium => "-gravity center -extent 1024x1024",
                          :thumb => "-gravity center -extent 100x100" }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end

