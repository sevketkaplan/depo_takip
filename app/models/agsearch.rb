class Agsearch < ApplicationRecord
	def find_aracgideris
		
		@query=Aracgideri.where("plaka like ?", "%#{plaka}%")

		
		if !min_date.blank?
			@query=@query.where("created_at>=?", min_date)
		end
		if !max_date.blank? 
			@query=@query.where("created_at<=?",max_date)
		end
		@query.all.order("created_at DESC")
		
	end
end
