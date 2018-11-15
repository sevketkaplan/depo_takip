class AddDateToUrunlers < ActiveRecord::Migration[5.2]
  def change
    add_column :urunlers, :date, :date
  end
end
