class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :title
      t.text :url
      t.text :content
      t.text :descrition
      t.text :image
      t.datetime :published
      t.string :guid
      t.references :feed, foreign_key: true

      t.timestamps
    end
  end
end
