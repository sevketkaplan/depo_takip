class ChangeBirimFiyatTypeInSatilans < ActiveRecord::Migration[5.2]
	def self.up
		change_column :satilans, :birim_fiyat, :float
	end
	
	def self.down
		change_column :satilans, :birim_fiyat, :integer
	end
end
