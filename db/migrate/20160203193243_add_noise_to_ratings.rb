class AddNoiseToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :noise, :integer
  end
end
