class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :value
      t.string :image_url

      t.timestamps
    end
  end
end
