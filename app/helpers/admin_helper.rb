module AdminHelper
	def checked(person,area)
		 person.nil? ? false : person.match(area)
	end 
end
