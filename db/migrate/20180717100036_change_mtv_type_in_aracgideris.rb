class ChangeMtvTypeInAracgideris < ActiveRecord::Migration[5.2]
   def self.up
		change_column :aracgideris, :mtv, :float
	end

	def self.down
		change_column :aracgideris, :mtv, :integer
	end
end
