class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :note

 	has_attached_file :image, 
					  :styles => { :medium => "440x440>", :thumb => "100x100#" },## NO BORRAR 
					  :default_url => "/images/:style/missing.png"

	# #Ejemplo Dropbox
	# has_attached_file :storage => :dropbox,
	# 				    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
	# 				    :styles => { :medium => "300x300" },
	# 				    :dropbox_options => {
	# 				      :path => proc { |style| "#{style}/#{id}_#{avatar.original_filename}" }
	# 				    }


  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


  	def self.search(search)
	    if search[:name].present?
	    	where("name LIKE '%#{search[:name]}%' OR description LIKE '%#{search[:name]}%'")
		elsif search[:category].present?
			where("category_id = ?", search[:category])
		elsif search[:note].present?
			where("note_id = ?", search[:note])
		else
		    #scoped
		end
	end

	# after_save :save_image, :save_image_path

	# def image=(file_data)
	# 	unless file_data.blank?
	# 		@file_data = file_data
	# 		@extension = file_data.original_filename.split('.').last.downcase	
	# 	end
		
	# end

	# def photo_filename
	# 	File.join Rails.root, 'public', 'img', 'products', "#{id}.#{@extension}"

	# end

	# private

	# def save_image
	# 	if @file_data
	# 		File.open(photo_filename,'wb') do |f|
	# 			f.write(@file_data.read)
	# 		end
	# 		@file_data = nil			
	# 	end
	# end

	# def save_image_path
	# 	product_id_2 = self.id

	# 	image_path_new = "/img/products/#{product_id_2}.#{@extension}"
	# 	self.update_column(:image_path, image_path_new)
	# end

end
