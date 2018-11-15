class ChangeKiraTypeInFirmagideris < ActiveRecord::Migration[5.2]
 def self.up
		change_column :firmagideris, :kira, :float
	end

	def self.down
		change_column :firmagideris, :kira, :integer
	end
end
