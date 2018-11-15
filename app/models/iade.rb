class Iade < ApplicationRecord

	paginates_per 25
	def self.search(keywords)
		iade = order(date: :DESC)
		iade = Iade.where("date like ?", "%#{keywords}%") if keywords.present?
		iade
	end

	def self.to_csv(options = {})
		desired_columns = ["id", "teslim_yeri", "adi", "paket_tipi", "adet", "birim_fiyat", "toplam_fiyat", "date", "dagitici"]
		CSV.generate(options) do |csv|
			csv << desired_columns
			all.each do |iade|
				csv << iade.attributes.values_at(*desired_columns)
			end
		end
	end
end
