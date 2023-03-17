class AddBookTitleToInteractions < ActiveRecord::Migration[7.0]
  def change
    add_column :interactions, :book_title, :string
    add_column :interactions, :book_author, :string
  end
end
