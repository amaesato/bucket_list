class Item < ApplicationRecord
  belongs_to :bucket
  validates_presence_of :item_name

  has_attached_file :image, styles: { small: ["300x300#", :jpg] }
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
