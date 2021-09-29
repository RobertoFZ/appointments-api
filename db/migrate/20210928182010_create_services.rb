class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.string :description

      t.timestamps
    end
  end
end
