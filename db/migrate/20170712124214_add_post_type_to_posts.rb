class AddPostTypeToPosts < ActiveRecord::Migration[5.1]
  def up
    add_column :posts, :post_type, :integer, default: 0
  end

  def down
    remove_column :posts, :post_type
  end
end
