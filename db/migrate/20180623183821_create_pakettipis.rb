class CreatePakettipis < ActiveRecord::Migration[5.2]
  def change
    create_table :pakettipis do |t|
      t.string :paket_tipi
      t.references :urunadi, foreign_key: true

      t.timestamps
    end
  end
end
