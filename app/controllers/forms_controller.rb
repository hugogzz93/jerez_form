class FormsController < ApplicationController
	def new
		
	end

	def create
		FormMailer.send_form(params.keys.map {|x| params[x]}).deliver_later
	end
end
