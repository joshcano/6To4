json.extract! transaction, :id, :post_id, :amount, :user_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
