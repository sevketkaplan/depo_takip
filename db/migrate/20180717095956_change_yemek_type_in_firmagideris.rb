class ChangeYemekTypeInFirmagideris < ActiveRecord::Migration[5.2]
  def self.up
		change_column :firmagideris, :yemek, :float
	end

	def self.down
		change_column :firmagideris, :yemek, :integer
	end
end
