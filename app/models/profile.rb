class Profile < ActiveRecord::Base
  def self.search(query)
    Profile.where("description ILIKE :query OR display_name ILIKE :query OR email ILIKE :query", { :query => "%#{query}%" })
  end
end

