class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :wifi

      t.timestamps null: false
    end
  end
end
