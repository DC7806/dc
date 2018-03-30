class CreatePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolios do |t|
      t.string :title
      t.string :portfolio_type
      t.text :description
      t.text :content
      t.string :permalink

      t.timestamps
    end
  end
end
