class CreateSuts < ActiveRecord::Migration[5.2]
  def change
    create_table :suts do |t|
      t.integer :miktar

      t.timestamps
    end
  end
end
