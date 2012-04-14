class Product < ActiveRecord::Base

  has_attached_file :picture,
                    styles: { small: "176x176>", big: "500x500>" },
                    path: ":rails_root/public/system/:attachment/:id/:style/:filename",
                    url: "/system/:attachment/:id/:style/:filename"

  attr_accessible :album, :artist, :description, :qty, :price, :on_sale, :sale_price, :category_id, :picture

  belongs_to :category

  validates_presence_of   :album, :artist, :category_id, :qty, :price, :picture
  validates :qty,         numericality: { greater_than_or_equal_to: 0 }
  validates :price,       numericality: { greater_than: 0 }
  validates :sale_price,  numericality: { greater_than: 0, less_than_or_equal_to: :price }
  validates :on_sale ,    inclusion: { in: [true, false] }
  validates_attachment_size  :picture, in: 0..2.megabytes

  searchable do
    text :album, :artist, :description
  end
end
