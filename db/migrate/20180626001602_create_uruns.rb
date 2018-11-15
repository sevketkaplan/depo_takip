class CreateUruns < ActiveRecord::Migration[5.2]
  def change
    create_table :uruns do |t|
      t.string :adi
      t.string :paket_tipi
      t.integer :stok
      t.date :date

      t.timestamps
    end
  end
end
