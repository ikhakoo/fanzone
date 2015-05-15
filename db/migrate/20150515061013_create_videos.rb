class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.datetime :published
      t.string :title
      t.string :url
      t.string :description

      t.timestamps null: false
    end
  end
end
