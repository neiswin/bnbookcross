class CreatePlaces < ActiveRecord::Migration[7.0]

  def change
    create_table :places do |t|
      t.string :place_name

      t.timestamps
    end
  end
  


end
