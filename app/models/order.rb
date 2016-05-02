class Order < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	PAYMENT_TYPES = ["Check", "Credit card", "Purchase order"]

	validates :name, :address, :email, presence: true
	validates :pay_type, inclusion: PAYMENT_TYPES

	def add_line_items_from_cart(cart)
		#The code below did not work.  I assumed that there were invisible variables in the model that I could
		#change by just re-assigning them new values, like I did below
		@address = "I CHANGED THIS IN THE MODEL,  ITS LONG AND CAPPED SO I WOULD SEE IT EASILY"
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
		#The line below proves that line(15) appends a new value to the line_items collection for the order object
		#line_items << LineItem.new(product_id: 3)
		puts "**************************************"
		puts "HERE BE THY LINE ITEMS"
		line_items.each do |item|
			puts "Title: #{item.product.title}"
			puts "Order: #{item.order}" 
		end
		puts "**************************************"
		#Both of the below statements produce the same output
		puts self.name
		puts name
		puts "**************************************"
	end
end
