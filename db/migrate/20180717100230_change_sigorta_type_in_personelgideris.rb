class ChangeSigortaTypeInPersonelgideris < ActiveRecord::Migration[5.2]
  def self.up
		change_column :personelgideris, :sigorta, :float
	end

	def self.down
		change_column :personelgideris, :sigorta, :integer
	end
end
