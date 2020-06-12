class AddNamedUrlToBlog < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :named_url, :string
  end
end
