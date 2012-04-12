class Product < ActiveRecord::Base
  attr_accessible :album, :artist, :description, :qty, :price, :on_sale, :sale_price, :category_id

  belongs_to :category

  validates_presence_of   :album, :artist, :category_id, :qty, :price
  validates :qty,         numericality: { greater_than_or_equal_to: 0 }
  validates :price,       numericality: { greater_than: 0 }
  validates :sale_price,  numericality: { greater_than: 0, less_than_or_equal_to: :price }
  validates :on_sale ,    inclusion: { in: [true, false] }

  searchable do
    text :album, :artist, :description
  end
end
