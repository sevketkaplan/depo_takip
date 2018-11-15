class CreateOdemes < ActiveRecord::Migration[5.2]
  def change
    create_table :odemes do |t|
      t.string :teslim_yeri
      t.string :odeme_miktari
      t.string :dagitici
      t.date :date

      t.timestamps
    end
  end
end
