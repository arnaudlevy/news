class AddFullTextToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :full_text, :text
  end
end
