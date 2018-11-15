class ChangeDogalgazTypeInFirmagideris < ActiveRecord::Migration[5.2]
  def self.up
		change_column :firmagideris, :dogalgaz, :float
	end

	def self.down
		change_column :firmagideris, :dogalgaz, :integer
	end
end
