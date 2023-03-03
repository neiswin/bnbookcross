class Book < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :place, optional: true

  validates :title, presence: true, length: { minimum: 2 }
  validates :author, presence: true, length: { minimum: 2 }
  
end
