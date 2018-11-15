class ChangeToplamFiyatTypeInIades < ActiveRecord::Migration[5.2]
  	def self.up
		change_column :iades, :toplam_fiyat, :float
	end

	def self.down
		change_column :iades, :toplam_fiyat, :integer
	end
end
