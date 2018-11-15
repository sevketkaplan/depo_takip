class ChangeBakimTypeInAracgideris < ActiveRecord::Migration[5.2]
 def self.up
		change_column :aracgideris, :bakim, :float
	end

	def self.down
		change_column :aracgideris, :bakim, :integer
	end
end
