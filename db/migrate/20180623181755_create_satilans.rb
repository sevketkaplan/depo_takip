class CreateSatilans < ActiveRecord::Migration[5.2]
  def change
    create_table :satilans do |t|
      t.string :teslim_yeri
      t.string :adi
      t.string :paket_tipi
      t.integer :adet
      t.integer :birim_fiyat
      t.integer :toplam_fiyat
      t.date :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
