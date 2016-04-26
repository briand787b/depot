class StoreController < ApplicationController
  include CurrentVisit

  def index
  	@products = Product.order(:title)

 		count_visit
  end
end
