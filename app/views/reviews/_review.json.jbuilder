json.extract! review, :id, :title, :content, :item_id, :user_id, :rating, :created_at, :updated_at
json.url review_url(review, format: :json)
