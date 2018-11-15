class Search < ApplicationRecord
	

	def self.to_csv(options = {})
		desired_columns = ["id", "teslim_yeri", "adi", "paket_tipi", "adet", "birim_fiyat", "toplam_fiyat", "date", "user_id"]
		CSV.generate(options) do |csv|
			csv << desired_columns
			all.each do |satilan|
				csv << satilan.attributes.values_at(*desired_columns)
			end
		end
	end

	def find_satilans
		
		
		@query=Satilan.where("teslim_yeri like ? AND adi like ? AND paket_tipi like ?",
			"%#{teslim_yeri}%","%#{adi}%" , "%#{paket_tipi}%")

		if !dağitici.blank?
			@query=@query.where("user_id=?", dağitici)
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
