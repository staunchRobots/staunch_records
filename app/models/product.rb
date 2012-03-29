class Product < ActiveRecord::Base
  attr_accessible :album, :artist, :description, :qty, :price, :on_sale, :sale_price

  belongs_to :category

  validates_presence_of   :album, :artist, :category_id
  validates :qty,         numericality: { greater_than_or_equal_to: 0 }
  validates :price,       numericality: { greater_than: 0 }
  validates :on_sale ,    inclusion: { in: [:true, :false] }
  validates :sale_price,  numericality: { greater_than: 0, less_than_or_equal_to: :price }
end
