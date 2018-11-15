class CreateFirmagideris < ActiveRecord::Migration[5.2]
  def change
    create_table :firmagideris do |t|
      t.integer :elektrik
      t.integer :su
      t.integer :kira
      t.integer :dogalgaz
      t.integer :vergi
      t.integer :yemek

      t.timestamps
    end
  end
end
