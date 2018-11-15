class Isearch < ApplicationRecord
	def self.to_csv(options = {})
		desired_columns = ["id", "teslim_yeri", "adi", "paket_tipi", "adet", "birim_fiyat", "toplam_fiyat", "date", "dagitici"]
		CSV.generate(options) do |csv|
			csv << desired_columns
			all.each do |iade|
				csv << iade.attributes.values_at(*desired_columns)
			end
		end
	end

	def find_iades
		
		
		@query=Iade.where("teslim_yeri like ? AND adi like ? AND paket_tipi like ?",
			"%#{teslim_yeri}%","%#{adi}%" , "%#{paket_tipi}%")

		if !dagitici.blank?
			@query=@query.where("dagitici=?", dagitici)
		end
		if !min_date.blank?
			@query=@query.where("date>=?", min_date)
		end
		if !max_date.blank? 
			@query=@query.where("date<=?",max_date)
		end
		@query.all.order("created_at DESC")
		
	end
end
