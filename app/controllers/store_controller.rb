class StoreController < ApplicationController
  include CurrentVisit
  include CurrentCart
  before_action :set_cart

  def index
  	@products = Product.order(:title)

 		count_visit
  end
end
