class CreateAracgideris < ActiveRecord::Migration[5.2]
  def change
    create_table :aracgideris do |t|
      t.integer :yakit
      t.integer :mtv
      t.integer :bakim
      t.integer :sigorta
      t.integer :kasko
      t.string :plaka

      t.timestamps
    end
  end
end
