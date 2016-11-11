json.extract! contact, :id, :email, :message, :user, :created_at, :updated_at
json.url contact_url(contact, format: :json)