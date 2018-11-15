class Personelgideri < ApplicationRecord
	paginates_per 25
	def self.search(keywords)
		personelgideri = order(created_at: :DESC)
		personelgideri = Personelgideri.where("created_at like ?", "%#{keywords}%") if keywords.present?
		personelgideri
	end

	def self.to_csv(options = {})
		desired_columns = ["id","maas","sigorta","created_at"]
		CSV.generate(options) do |csv|
			csv << desired_columns
			all.each do |personelgideri|
				csv << personelgideri.attributes.values_at(*desired_columns)
			end
		end
	end
end
