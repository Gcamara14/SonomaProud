class Business < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  # attachments
  has_attached_file :image, styles: {  large: "750x750" ,medium: "300x300>", thumb: "100x100>" }, default_url: "https://s3-us-west-1.amazonaws.com/recipe-app-gio/recipes/images/000/000/008/medium/sonomaProud.png"
  
  # assoc
  belongs_to :user, optional: true

  # validations
  validates :name, :description, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  # scopes
  scope :published, -> { where(published: true) }
  scope :not_published, -> { where(published: false) }
end