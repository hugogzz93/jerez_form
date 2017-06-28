class FormsController < ApplicationController
	def new
		
	end

	def create
		debugger
		FormMailer.send_form(params.keys, params.values).deliver_later
	end
end
