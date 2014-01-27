class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :welcome_message
      t.text :thankyou_message
      t.boolean :is_open
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
