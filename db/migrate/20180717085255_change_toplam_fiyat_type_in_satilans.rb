class ChangeToplamFiyatTypeInSatilans < ActiveRecord::Migration[5.2]
	def self.up
		change_column :satilans, :toplam_fiyat, :float
	end

	def self.down
		change_column :satilans, :toplam_fiyat, :integer
	end
end
