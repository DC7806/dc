class AddSortToPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :sort, :integer
  end
end
