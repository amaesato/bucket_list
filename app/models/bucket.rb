class Bucket < ApplicationRecord
  has_many :items, dependent: :destroy
  validates_presence_of :name

  has_attached_file :image,
                      styles: { thumb: ["64x64#", :jpg],
                      original: ['500x500>', :jpg] },
                    convert_options: { thumb: "-quality 75 -strip",
                      original: "-quality 85 -strip" }
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  def self.theme
    %w(Everything Adventure Relationship Creativity Entertainment Health Finance Food Just\ Because Personal\ Growth Travel)
  end
end
