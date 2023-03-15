class Book < ApplicationRecord
  include Authorship
  
  belongs_to :user, optional: true
  belongs_to :place, optional: true
  has_many :bookcrossing, dependent: :destroy

  validates :title, presence: true, length: { minimum: 2 }
  validates :author, presence: true, length: { minimum: 2 }
  
  def self.ransackable_attributes(auth_object = nil)
    ["author", "condition_book", "counter_how_much_give", "created_at", "description", "id", "place_id", "status_book", "title", "updated_at", "user_id"]
  end
end
