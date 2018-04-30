class AddRepoToPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :repo, :string
    remove_column :portfolios, :content
    remove_column :portfolios, :permalink
  end
end
