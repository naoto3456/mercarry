class CreateCategoryl1s < ActiveRecord::Migration[5.1]
  def change
    create_table :categoryl1s do |t|
 	   	t.string :name
      t.timestamps
    end
  end
end
