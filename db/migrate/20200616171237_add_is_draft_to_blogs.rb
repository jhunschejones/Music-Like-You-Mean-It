class AddIsDraftToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :is_draft, :boolean, default: true
  end
end
