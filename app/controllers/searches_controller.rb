class SearchesController < ApplicationController
	before_action :authenticate_user!
	def index
		@search = Search.find(params[:id])
		@data=@search.find_satilans
		respond_to do |format|
			format.html
			format.csv { send_data @search.to_csv}
			format.xls
		end
	end
	def new
		@search=Search.new
	end

	def create
		@search=Search.create!(allowed_params)
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
		respond_to do |format|
			format.html
			format.csv { send_data Call.to_csv(@search)}
			format.xls
		end
	end
	private

	def allowed_params
		params.require(:search).permit!
	end
end
