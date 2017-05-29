class CreateCategoryl2s < ActiveRecord::Migration[5.1]
  def change
    create_table :categoryl2s do |t|
    	t.integer :categoryl1_id
    	t.string :name
      t.timestamps
    end
  end
end
