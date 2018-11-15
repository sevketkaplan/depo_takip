class AddAdSoyadToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ad_soyad, :string
  end
end
