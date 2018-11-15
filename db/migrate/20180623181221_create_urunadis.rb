class CreateUrunadis < ActiveRecord::Migration[5.2]
  def change
    create_table :urunadis do |t|
      t.string :adi

      t.timestamps
    end
  end
end
