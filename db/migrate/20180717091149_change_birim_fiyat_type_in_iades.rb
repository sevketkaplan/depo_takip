class ChangeBirimFiyatTypeInIades < ActiveRecord::Migration[5.2]
 	def self.up
		change_column :iades, :birim_fiyat, :float
	end

	def self.down
		change_column :iades, :birim_fiyat, :integer
	end
end
