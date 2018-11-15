class ChangeSuTypeInFirmagideris < ActiveRecord::Migration[5.2]
def self.up
		change_column :firmagideris, :su, :float
	end

	def self.down
		change_column :firmagideris, :su, :integer
	end
end
