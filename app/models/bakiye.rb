class Bakiye < ApplicationRecord
	paginates_per 25
	def self.search(keywords)
		satilan = order(date: :DESC)
		satilan = Bakiye.where("date like ?", "%#{keywords}%") if keywords.present?
		satilan
	end
	def self.to_csv(options = {})
		desired_columns = ["id", "teslim_yeri","toplam_borc","date"]
		CSV.generate(options) do |csv|
			csv << desired_columns
			all.each do |bakiye|
				csv << bakiye.attributes.values_at(*desired_columns)
			end
		end
	end
end
