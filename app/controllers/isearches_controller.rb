class IsearchesController < ApplicationController
	before_action :authenticate_user!

	def new
		@search=Isearch.new
	end

	def create
		@search=Isearch.create!(allowed_params)
		redirect_to @search
	end

	def show
		@search = Isearch.find(params[:id])
		respond_to do |format|
			format.html
			format.csv { send_data Call.to_csv(@search)}
			format.xls
		end
	end
	private

	def allowed_params
		params.require(:isearch).permit!
	end
end
