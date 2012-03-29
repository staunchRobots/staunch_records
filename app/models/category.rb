class Category < ActiveRecord::Base
  attr_accessible :name, :color

  validates_presence_of :name, :color
end
