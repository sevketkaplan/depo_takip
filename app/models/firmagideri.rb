class Firmagideri < ApplicationRecord
	paginates_per 25
	def self.search(keywords)
		firmagideri = order(created_at: :DESC)
		firmagideri= Firmagideri.where("created_at like ?", "%#{keywords}%") if keywords.present?
		firmagideri
	end

	paginates_per 25
	def self.to_csv(options = {})
		desired_columns = ["id", "elektrik", "su", "kira", "dogalgaz", "vergi", "yemek", "created_at"]
		CSV.generate(options) do |csv|
			csv << desired_columns
			all.each do |firmagideri|
				csv << firmagideri.attributes.values_at(*desired_columns)
			end
		end
	end
end
