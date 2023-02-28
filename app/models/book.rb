class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 2 }
  validates :author, presence: true, length: { minimum: 2 }
  
end
