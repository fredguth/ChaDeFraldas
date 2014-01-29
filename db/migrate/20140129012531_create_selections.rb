class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.belongs_to :event, index: true
      t.belongs_to :product, index: true

      t.timestamps
    end
  end
end
