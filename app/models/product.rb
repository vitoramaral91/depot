class Product < ApplicationRecord
    validates :title, :description, :image_url, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }
    validates :title, uniqueness: true
    validates :title, length: {minimum: 3, message: 'minimum is 3 characters to the title.'}
    validates :description, length: {minimum: 10, message: 'minimum is 10 characters to the description.'}
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png)\z}i,
        message: 'must be a URL for GIF, JPG or PNG image.'
        }
        
end
