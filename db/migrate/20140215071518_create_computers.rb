class CreateComputers < ActiveRecord::Migration
  def change
    create_table :computers do |t|
      t.string :name
      t.string :product_url
      t.string :image_url
      t.string :price

      t.timestamps
    end
  end
end
