class Place < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :bookcrossing, dependent: :destroy
end
