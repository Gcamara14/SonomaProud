class Business < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://s3-us-west-1.amazonaws.com/recipe-app-gio/recipes/images/000/000/008/medium/sonomaProud.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user
end