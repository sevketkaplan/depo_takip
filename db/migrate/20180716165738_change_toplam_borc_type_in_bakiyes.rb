class ChangeToplamBorcTypeInBakiyes < ActiveRecord::Migration[5.2]
    def self.up
    change_column :bakiyes, :toplam_borc, :float
  end
 
  def self.down
    change_column :bakiyes, :toplam_borc, :string
  end
end
