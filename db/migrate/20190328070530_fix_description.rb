class FixDescription < ActiveRecord::Migration[5.2]
  def change
    rename_column :entries, :descrition, :description
  end
end
