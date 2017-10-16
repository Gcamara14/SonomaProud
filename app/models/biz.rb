class Biz < ApplicationRecord
	extend FriendlyId
	friendly_id :name, use: :slugged

	validates :name, :description, presence: true
end
