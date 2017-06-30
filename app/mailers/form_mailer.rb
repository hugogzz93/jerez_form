class FormMailer < ApplicationMailer
	def send_form(data, recipients)
		attachments["#{data[:project_name]}.xlsx"] = File.read("#{data[:project_name]}.xlsx")
		mail(to: recipients[0], cc: recipients[1], subject: "Reporte - #{data[:project_name]}")
	end
end

# spreadsheet_file = StringIO.new
#  data.write(spreadsheet_file)
#  attachments['HelloWorld.xls'] = spreadsheet_file.read