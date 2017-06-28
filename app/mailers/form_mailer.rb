class FormMailer < ApplicationMailer
	def send_form(data)
		debugger
		@data = data
		mail(to: data[18], subject: 'Jerez Formulario')
	end
end
