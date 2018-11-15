class ChangeSigortaTypeInAracgideris < ActiveRecord::Migration[5.2]
  def self.up
		change_column :aracgideris, :sigorta, :float
	end

	def self.down
		change_column :aracgideris, :sigorta, :integer
	end
end
