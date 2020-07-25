class AddWorkshopPageViewsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :workshop_page_views, :bigint, default: 0
  end
end
