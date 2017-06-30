class FormMailer < ApplicationMailer
	def send_form(data)
		attachments["#{data[:project_name]}.xlsx"] = File.read("#{data[:project_name]}.xlsx")
		mail(to: data[:mail], subject: "Reporte - #{data[:project_name]}")
		mail(to: data[:mailc], subject: "Reporte - #{data[:project_name]}")
	end
end

# spreadsheet_file = StringIO.new
#  data.write(spreadsheet_file)
#  attachments['HelloWorld.xls'] = spreadsheet_file.read