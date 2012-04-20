class CartsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @cart = current_user.cart

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cart.products }
    end
  end
end
