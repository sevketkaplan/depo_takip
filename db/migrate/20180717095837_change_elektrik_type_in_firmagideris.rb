class ChangeElektrikTypeInFirmagideris < ActiveRecord::Migration[5.2]
 def self.up
		change_column :firmagideris, :elektrik, :float
	end

	def self.down
		change_column :firmagideris, :elektrik, :integer
	end
end
