class CreateOsearches < ActiveRecord::Migration[5.2]
  def change
    create_table :osearches do |t|
      t.string :teslim_yeri
      t.string :dagitici
      t.date :date

      t.timestamps
    end
  end
end
