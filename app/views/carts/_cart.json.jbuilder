json.extract! cart, :id, :order_id, :variant_id, :user_id, :quantity, :created_at, :updated_at
json.url cart_url(cart, format: :json)
