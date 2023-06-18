class CreatePeoples < ActiveRecord::Migration[7.0]
  def change
    create_table :peoples do |t|
      t.integer :id
      t.string :name
      t.integer :age
      t.integer :IDon

      t.timestamps
    end
  end
end
