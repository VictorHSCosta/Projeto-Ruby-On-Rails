json.extract! item, :id, :name, :due_date, :completed, :position, :list_id, :created_at, :updated_at
json.url item_url(item, format: :json)
