module CategoriesHelper
  def category_list
    Category.order("name")
  end
end
