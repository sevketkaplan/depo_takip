class CreatePersonelgideris < ActiveRecord::Migration[5.2]
  def change
    create_table :personelgideris do |t|
      t.integer :maas
      t.integer :sigorta

      t.timestamps
    end
  end
end
