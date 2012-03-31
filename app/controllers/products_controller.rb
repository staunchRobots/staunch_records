class ProductsController < ApplicationController
  before_filter :

  def index
    @products = @category.products
  end

  def show
    @product = @category.products.find(params[:id])
  end

  private

    def article
      @category = Category.find(params[:category_id])
    end
end
