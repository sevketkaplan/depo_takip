class ChangeYakitTypeInAracgideris < ActiveRecord::Migration[5.2]
 def self.up
		change_column :aracgideris, :yakit, :float
	end

	def self.down
		change_column :aracgideris, :yakit, :integer
	end
end
