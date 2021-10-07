class AddComentToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :coment, :string
  end
end
