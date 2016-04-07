class Contact < ActiveRecord::Base
	def self.search(search)
	    if search[:name].present?
	    	where("name LIKE '%#{search[:name]}%'")
		elsif search[:email].present?
			where("email LIKE '%#{search[:email]}%'")
		elsif search[:read].present?
			if search[:read] == 0
				where("read_contact is not true" )
			else
				where("read_contact = ?", true )
			end
		else
		    #scoped
		end
	end
end
