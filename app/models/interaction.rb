class Interaction < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :book, optional: true
  belongs_to :place, optional: true


  validates :book_title, presence: true, length: { minimum: 2 }
  validates :book_author, presence: true, length: { minimum: 2 }
  validates :phone_number, presence: true, length: { minimum: 7 }

end
