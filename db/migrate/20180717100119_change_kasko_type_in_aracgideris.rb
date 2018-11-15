class ChangeKaskoTypeInAracgideris < ActiveRecord::Migration[5.2]
   def self.up
		change_column :aracgideris, :kasko, :float
	end

	def self.down
		change_column :aracgideris, :kasko, :integer
	end
end
