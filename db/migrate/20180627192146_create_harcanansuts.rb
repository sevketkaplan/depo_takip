class CreateHarcanansuts < ActiveRecord::Migration[5.2]
  def change
    create_table :harcanansuts do |t|
      t.integer :harcanan
      t.date :date

      t.timestamps
    end
  end
end
