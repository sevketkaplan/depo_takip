class ChangeOdemeMiktariTypeInOdemes < ActiveRecord::Migration[5.2]
   def self.up
    change_column :odemes, :odeme_miktari, :float
  end
 
  def self.down
    change_column :odemes, :odeme_miktari, :string
  end
end
