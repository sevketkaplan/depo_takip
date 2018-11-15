class Aracgideri < ApplicationRecord

	paginates_per 25
	def self.search(keywords)
		aracgideri = order(created_at: :DESC)
		aracgideri = Aracgideri.where("created_at like ?", "%#{keywords}%") if keywords.present?
		aracgideri
	end
	def self.to_csv(options = {})
		desired_columns = ["id", "yakit", "mtv", "bakim", "sigorta", "kasko", "plaka", "created_at"]
		CSV.generate(options) do |csv|
			csv << desired_columns
			all.each do |aracgideri|
				csv << aracgideri.attributes.values_at(*desired_columns)
			end
		end
	end
end
