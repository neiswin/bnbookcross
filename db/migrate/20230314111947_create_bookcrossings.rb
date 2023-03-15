class CreateBookcrossings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookcrossings do |t|
      t.string :type_bookcrossing
      t.belongs_to :book
      t.belongs_to :user
      t.belongs_to :place

      t.timestamps
    end
  end
end
