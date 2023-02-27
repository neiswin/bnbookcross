class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.integer :counter_how_much_give, default: 0
      t.integer :condition_book_book, default: 0
      t.integer :status_book, default: 0

      t.timestamps
    end
  end
end
