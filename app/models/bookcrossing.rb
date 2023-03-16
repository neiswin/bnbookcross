class Bookcrossing < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :book, optional: true
  belongs_to :place, optional: true
end
