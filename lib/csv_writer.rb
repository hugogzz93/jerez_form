class CSVWriter
	attr_accessor :file_name

	def initialize(row_writer)
		@row_writer = row_writer
	end

	def write_to(file_name)
		Axlsx::Package.new do |p|
			p.workbook.add_worksheet(:name => "Report") do |ws|
				(1..@row_writer.number_of_rows - 3).each do |row|
					red = ws.styles.add_style(bg_color: 'F2DBDB', fg_color: 'ffffff', alignment: {horizontal: :center})
		      blue = ws.styles.add_style(bg_color: '1F497D', fg_color: 'ffffff', alignment: {horizontal: :center})
		      row = ws.add_row @row_writer.row(row)
		      row[0].style = blue
			    row[1].style = red
				end

				['how_to_get', 'security'].each do |special|
					rows = @row_writer.send special
					ws.add_row [special]
					rows.each { |r| ws.add_row [r]}
					ws.add_row ['']
				end
				directions = @row_writer.how_to_get
			end
			p.serialize(file_name)
		end
	end
end
