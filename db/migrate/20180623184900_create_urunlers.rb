class CreateUrunlers < ActiveRecord::Migration[5.2]
  def change
    create_table :urunlers do |t|
      t.string :adi
      t.string :paket_tipi
      t.integer :stok

      t.timestamps
    end
  end
end
