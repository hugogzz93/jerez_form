class FormMailer < ApplicationMailer
	def send_form(data)
		row_writer = RowWriter.new data
		csv_writer = CSVWriter.new row_writer
		csv_writer.write_to 'report.xlsx'
		attachments['report.xlsx'] = File.read('report.xlsx')
		mail(to: 'pinelo93@gmail.com', subject: 'Jerez Formulario')
	end
end

# spreadsheet_file = StringIO.new
#  data.write(spreadsheet_file)
#  attachments['HelloWorld.xls'] = spreadsheet_file.read