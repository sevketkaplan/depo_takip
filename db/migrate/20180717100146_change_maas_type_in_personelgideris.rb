class ChangeMaasTypeInPersonelgideris < ActiveRecord::Migration[5.2]
 def self.up
		change_column :personelgideris, :maas, :float
	end

	def self.down
		change_column :personelgideris, :maas, :integer
	end
end
