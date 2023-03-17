class CreateInteractions < ActiveRecord::Migration[7.0]
  def change
    create_table :interactions do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.references :place, foreign_key: true
      t.string :phone_number

      t.timestamps
    end
  end
end
