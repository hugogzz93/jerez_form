class FormMailer < ApplicationMailer
	def send_form(keys, values)
		@data = {}
		keys.each_with_index {|x, i| @data[x] = values[i]}
		mail(to: 'pinelo93@gmail.com', subject: 'Jerez Formulario')
	end
end
