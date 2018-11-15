class CreateBakiyes < ActiveRecord::Migration[5.2]
  def change
    create_table :bakiyes do |t|
      t.string :teslim_yeri
      t.string :toplam_borc
      t.date :date

      t.timestamps
    end
  end
end
