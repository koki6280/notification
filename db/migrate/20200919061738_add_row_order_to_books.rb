class AddRowOrderToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :row_order, :integer
  end
end
