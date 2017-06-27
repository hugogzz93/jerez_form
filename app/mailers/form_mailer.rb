class FormMailer < ApplicationMailer
	def send_form(data)
		@data = data
		mail(to: data[:recipient], subject: 'Jerez Formulario')
	end
end
