class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :espn_id
      t.datetime :published
      t.string :title
      t.string :url

      t.timestamps null: false
    end
  end
end
