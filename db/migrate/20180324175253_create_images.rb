class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :page
      t.string :src
      t.string :alt
      t.references :imagable, polymorphic: true

      t.timestamps
    end
  end
end
