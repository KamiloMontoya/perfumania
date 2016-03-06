json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :category_id, :segment_id, :image_path
  json.url product_url(product, format: :json)
end
