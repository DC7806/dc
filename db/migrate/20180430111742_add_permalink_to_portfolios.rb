class AddPermalinkToPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :permalink, :string
  end
end
