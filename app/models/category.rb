class Category < ActiveRecord::Base
  attr_accessible :name, :color

  has_many :products

  validates_presence_of :name, :color
end
