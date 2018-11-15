class AddDateToSuts < ActiveRecord::Migration[5.2]
  def change
    add_column :suts, :date, :date
  end
end
