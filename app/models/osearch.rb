class Osearch < ApplicationRecord

	paginates_per 25
	def find_odemes	
		
		@query=Odeme.where("teslim_yeri like ?","%#{teslim_yeri}%")

		if !dagitici.blank?
			@query=@query.where("dagitici=?", dagitici)
		end
		if !date.blank?
			@query=@query.where("date>=?", date)
		end
		if !max_date.blank? 
			@query=@query.where("date<=?",max_date)
		end
		@query
		
	end
end
