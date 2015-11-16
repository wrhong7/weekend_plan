class AddRecommendationIdToMaps < ActiveRecord::Migration
  def change
    add_column :maps, :recommendation_id, :integers
  end
end
