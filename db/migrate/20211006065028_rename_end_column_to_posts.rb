class RenameEndColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :end, :finish
  end
end
