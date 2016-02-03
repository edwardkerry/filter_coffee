class AddOutletsToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :outlets, :integer
  end
end
