class AddPlaceIdToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :place, foreign_key: true
  end
end
