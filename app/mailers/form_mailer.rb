class FormMailer < ApplicationMailer
	def send_form(data)
		attachments['report.xlsx'] = File.read('report.xlsx')
		mail(to: data[:mail], subject: 'Jerez Formulario')
	end
end

# spreadsheet_file = StringIO.new
#  data.write(spreadsheet_file)
#  attachments['HelloWorld.xls'] = spreadsheet_file.read