class ChangeVergiTypeInFirmagideris < ActiveRecord::Migration[5.2]
 def self.up
		change_column :firmagideris, :vergi, :float
	end

	def self.down
		change_column :firmagideris, :vergi, :integer
	end
end
