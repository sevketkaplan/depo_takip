class CreateIsearches < ActiveRecord::Migration[5.2]
  def change
    create_table :isearches do |t|
      t.string :teslim_yeri
      t.string :adi
      t.string :paket_tipi
      t.string :dagitici
      t.date :min_date
      t.date :max_date

      t.timestamps
    end
  end
end
