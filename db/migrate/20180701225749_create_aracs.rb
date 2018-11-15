class CreateAracs < ActiveRecord::Migration[5.2]
  def change
    create_table :aracs do |t|
      t.string :plaka

      t.timestamps
    end
  end
end
