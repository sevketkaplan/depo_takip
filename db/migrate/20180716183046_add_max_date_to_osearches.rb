class AddMaxDateToOsearches < ActiveRecord::Migration[5.2]
  def change
    add_column :osearches, :max_date, :date
  end
end
