class ProductsController < ApplicationController
  before_filter :get_category, except: [:index]
  before_filter :authenticate_user!, except: [:index]

  def index
    @search = Product.search do
      fulltext params[:q]
    end
    @products = @search.results if @search
  end

  def show
    @product = @category.products.find(params[:id])
  end

  private

    def get_category
      @category = Category.find(params[:category_id])
    end
end
