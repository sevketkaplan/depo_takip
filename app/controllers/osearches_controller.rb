class OsearchesController < ApplicationController
	before_action :authenticate_user!

	def new
		@search=Osearch.new
	end

	def create
		@search=Osearch.create!(allowed_params)
		redirect_to @search
	end

	def show
		@search = Osearch.find(params[:id])
		respond_to do |format|
			format.html
			format.csv { send_data Call.to_csv(@search)}
			format.xls
		end
	end
	private

	def allowed_params
		params.require(:osearch).permit!
	end
end
