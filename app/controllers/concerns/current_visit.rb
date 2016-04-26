module CurrentVisit
	
	private

	def count_visit
		if session[:count].nil?
  		session[:count] = 0
  	else
  		session[:count] += 1
  	end
	end
end