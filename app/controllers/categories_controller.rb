class CategoriesController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]
  before_filter :random_products, only: [:index]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @category_products = @category.products.where("qty > 0")
  end

  private

    def random_products
      @random_products = Product.where("qty > 0").limit(10).order("random()")
    end
end
