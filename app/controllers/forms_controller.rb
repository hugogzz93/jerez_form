class FormsController < ApplicationController
	def new
		
	end

	def create
		csv_writer = CSVWriter.new permitted_params.to_h
		csv_writer.write_to "#{params[:project_name]}.xlsx"

		FormMailer.send_form(permitted_params.to_h)
							.deliver_later
	end

	def permitted_params
		params.permit(:project_name, 
									:client_name, 
									:vendor_name, 
									:direction, 
									:colony, 
									:street, 
									:municipality, 
									:state, 
									:zip_code, 
									:recipient, 
									:phone, 
									:schedule, 
									:capacity, 
									:link, 
									:coordinates,
									:how_to_get,
									:security,
									:mail,
									:mailc
								)
		
	end
end
