class DropVideos < ActiveRecord::Migration
  def up
    drop_table :videos
  end

  def down
    create_table :videos do |t|
      t.string :source
      t.string :title
      t.string :url

      t.timestamps        
    end
    add_index :videos
  end
end
