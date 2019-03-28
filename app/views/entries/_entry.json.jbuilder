json.extract! entry, :id, :title, :url, :content, :descrition, :image, :published, :guid, :feed_id, :created_at, :updated_at
json.url entry_url(entry, format: :json)
