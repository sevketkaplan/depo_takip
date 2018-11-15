class Urunler < ApplicationRecord
	def self.to_csv(options = {})
		desired_columns = ["adi","paket_tipi","stok","date"]
		CSV.generate(options) do |csv|
			csv << desired_columns
			all.each do |urunler|
				csv << urunler.attributes.values_at(*desired_columns)
			end
		end
	end 
end
