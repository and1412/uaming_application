class Contact < ApplicationRecord
	validates :email, :message, :user, presence: true
	validates :email, uniqueness: true
end
