json.extract! book, :id, :name, :language, :created_at, :updated_at
json.url book_url(book, format: :json)
