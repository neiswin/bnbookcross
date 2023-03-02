class Book < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :title, presence: true, length: { minimum: 2 }
  validates :author, presence: true, length: { minimum: 2 }
  
end
