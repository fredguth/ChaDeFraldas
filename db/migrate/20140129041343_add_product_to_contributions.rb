class AddProductToContributions < ActiveRecord::Migration
  def change
    add_reference :contributions, :product, index: true
  end
end
