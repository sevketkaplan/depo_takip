class Satilan < ApplicationRecord
	belongs_to :user
	paginates_per 25
	def self.search(keywords)
		satilan = order(date: :DESC)
		satilan = Satilan.where("date like ?", "%#{keywords}%") if keywords.present?
		satilan
	end

	def self.to_csv(options = {})
		desired_columns = ["id", "teslim_yeri", "adi", "paket_tipi", "adet", "birim_fiyat", "toplam_fiyat", "date", "user_id"]
		CSV.generate(options) do |csv|
			csv << desired_columns
			all.each do |satilan|
				csv << satilan.attributes.values_at(*desired_columns)
			end
		end
	end
end
