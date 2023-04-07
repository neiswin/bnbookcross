class Place < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :interactions, dependent: :destroy
  belongs_to :user, optional: true
end
