require "csv"
class CSVWriter
	attr_accessor :file_name

	def initialize(row_writer)
		@row_writer = row_writer
	end

	def write_to(file_name)
		@file_name = file_name
		CSV.open(file_name, 'wb') do |csv|
			@row_writer.write(csv)
		end
	end
end