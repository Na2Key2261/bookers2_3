class BookComment < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  belongs_to :book
  has_many :book_comments, dependent: :destroy
end
