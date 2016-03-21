class Product < ActiveRecord::Base
	#attr_accessible :image_path, :description, :name, :category_id, :segment_id
 has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

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
