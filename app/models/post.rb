class Post < ApplicationRecord

  has_many_attached :images
  belongs_to :user

  validates :text, presence: { message: 'Text Can\'t be empty' }
end
