class CartItemsController < ApplicationController
  def add  
  @cart_item = CartItem.new(product_id: params[:id], user_id: current_user.id))

    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to [:admin, @admin_category], notice: 'The product was added to the cart' }
        format.json { render json: @admin_category, status: :created, location: @admin_category }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy

    respond_to do |format|
      format.html { redirect_to admin_categories_url }
      format.json { head :no_content }
    end
  end
end
