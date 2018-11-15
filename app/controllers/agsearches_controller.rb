class AgsearchesController < ApplicationController
	before_action :authenticate_user!

	def new
		@agsearch=Agsearch.new
	end

	def create
		@agsearch=Agsearch.create!(allowed_params)
		redirect_to @agsearch
	end

	def show
		@agsearch = Agsearch.find(params[:id])
		respond_to do |format|
			format.html
			format.csv { send_data Call.to_csv(@agsearch)}
			format.xls
		end
	end
	private

	def allowed_params
		params.require(:agsearch).permit!
	end
end
