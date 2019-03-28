class CreateFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :feeds do |t|
      t.string :title
      t.text :url
      t.datetime :last_import
      t.text :image
      t.text :description

      t.timestamps
    end
  end
end
