class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
    	t.string :name
    	t.string :seller_id
    	t.integer :categoryl1_id       
    	t.integer :categoryl2_id
    	t.string :description
    	t.integer :price
    	t.integer :condition
    	t.integer :shipping_paid_by
    	t.string :description
    	t.string :photo
    	t.integer :status
      t.timestamps
    end
  end
end
