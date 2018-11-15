class CreateAgsearches < ActiveRecord::Migration[5.2]
  def change
    create_table :agsearches do |t|
      t.string :plaka
      t.date :min_date
      t.date :max_date

      t.timestamps
    end
  end
end
