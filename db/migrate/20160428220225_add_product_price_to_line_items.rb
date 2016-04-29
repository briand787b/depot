class AddProductPriceToLineItems < ActiveRecord::Migration
  def up
  	add_column :line_items, :price, :decimal, precision: 8, scale: 2
  	LineItem.all.each do |item|
  		item.update(price: (item.product.price * item.quantity))
  	end
  end

  def down 
  	remove_column :line_items, :price
  end
end
