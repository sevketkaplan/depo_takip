class Harcanansut < ApplicationRecord
	paginates_per 25
	def self.to_csv(options = {})
		desired_columns = ["harcanan", "date"]
		CSV.generate(options) do |csv|
			csv << desired_columns
			all.each do |harcanan|
				csv << harcanan.attributes.values_at(*desired_columns)
			end
		end
	end
end
