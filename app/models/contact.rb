class Contact < ActiveRecord::Base
	def self.search(search)
	    if search[:name].present?
	    	where("name LIKE '%#{search[:name]}%'")
		elsif search[:email].present?
			where("email LIKE '%#{search[:email]}%'")
		elsif search[:read].present?
			where("read_contact = ?", search[:read].to_i)
		else
		    #scoped
		end
	end
end
