class Place < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :interactions, dependent: :destroy
end
