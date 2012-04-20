class CartItemsController < ApplicationController
  def create
  @cart_item = CartItem.new(product_id: params[:id], cart_id: current_user.cart.id)

    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to :back, notice: 'The product was added to the cart' }
        format.json { render json: @cart_item, status: :created, location: @cart_item }
      else
        format.html { redirect_to :back, notice: 'The product could not be added to the cart' }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
