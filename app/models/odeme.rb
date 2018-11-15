class Odeme < ApplicationRecord
	paginates_per 25
	def self.search(keywords)
		satilan = order(date: :DESC)
		satilan = Odeme.where("teslim_yeri like ?", "%#{keywords}%") if keywords.present?
		satilan
	end
	def self.to_csv(options = {})
		desired_columns = ["id", "teslim_yeri","odeme_miktari","dagitici","date"]
		CSV.generate(options) do |csv|
			csv << desired_columns
			all.each do |odeme|
				csv << odeme.attributes.values_at(*desired_columns)
			end
		end
	end
end
