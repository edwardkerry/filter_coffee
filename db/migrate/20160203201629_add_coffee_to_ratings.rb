class AddCoffeeToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :coffee, :integer
  end
end
