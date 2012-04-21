class CartsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @cart = current_user.cart

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cart.products }
    end
  end

  def clear
    @cart = current_user.cart
    @cart.clear

    respond_to do |format|
      format.html { redirect_to :back, notice: 'The cart was cleared' }
      format.json { head :no_content }
    end

  end
end
