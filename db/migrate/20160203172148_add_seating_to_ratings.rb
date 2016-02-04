class AddSeatingToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :seating, :integer
  end
end
