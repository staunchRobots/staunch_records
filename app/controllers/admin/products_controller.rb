class Admin::ProductsController < AdminController

  def index
    @products = Product.all
    respond_to do |format|
      format.html {}
      format.js { render :text => {:a => 'bbbb'}.to_json }
    end
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_products_path, notice: "Hurray! Product created" }
      else
        format.html { render :new }
      end
    end
  end

  def update
  end

  def delete
  end
end
