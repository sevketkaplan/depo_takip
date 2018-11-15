class CreateIades < ActiveRecord::Migration[5.2]
  def change
    create_table :iades do |t|
      t.string :teslim_yeri
      t.string :adi
      t.string :paket_tipi
      t.integer :adet
      t.integer :birim_fiyat
      t.integer :toplam_fiyat
      t.date :date
      t.string :dagitici

      t.timestamps
    end
  end
end
