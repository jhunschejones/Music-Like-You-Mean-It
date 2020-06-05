class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title, null: false
      t.text :embedded_video
      t.datetime :published_at
      # content field is stored using ActionText and not on the model

      t.timestamps
    end

    add_index :blogs, :title, unique: true
  end
end
