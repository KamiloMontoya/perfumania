class Product < ActiveRecord::Base
	#attr_accessible :image_path, :description, :name, :category_id, :segment_id
	after_save :save_image

	def image=(file_data)
		unless file_data.blank?
			@file_data = file_data
			@extension = file_data.original_filename.split('.').last.downcase	
			self.image_path = "/img/products/#{id}.#{@extension}"	
		end
		
	end

	def photo_filename
		File.join Rails.root, 'public', 'img', 'products', "#{id}.#{@extension}"
	end

	private

	def save_image
		if @file_data
			File.open(photo_filename,'wb') do |f|
				f.write(@file_data.read)
			end
			@file_data = nil

		end
	end

end
