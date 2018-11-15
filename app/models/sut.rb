class Sut < ApplicationRecord
	paginates_per 25

	def self.to_csv(options = {})
		desired_columns = ["miktar", "date"]
		CSV.generate(options) do |csv|
			csv << desired_columns
			all.each do |satilan|
				csv << satilan.attributes.values_at(*desired_columns)
			end
		end
	end
end
