class Place < ApplicationRecord
  has_many :books, dependent: :destroy
end
