class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :source
      t.string :title
      t.string :url

      t.timestamps null: false
    end
  end
end
