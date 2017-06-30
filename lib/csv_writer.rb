class CSVWriter
	attr_accessor :file_name

	def initialize(data)
		@row_writer = RowWriter.new data
	end

	def write_to(file_name)
		Axlsx::Package.new do |p|
			p.workbook.add_worksheet(:name => "Report") do |ws|
				ws.column_widths 8, 8, 16
	      key = ws.styles.add_style(alignment: {horizontal: :center})
				value = ws.styles.add_style(bg_color: 'F2DBDB', fg_color: '943733', alignment: {horizontal: :center})
	      title = ws.styles.add_style(bg_color: '1F497D', fg_color: 'ffffff', alignment: {horizontal: :center}, sz: 16)
	      row = ws.add_row ["", "ALTA DE FRENTE JEREZ"]
	     	row[1].style = title
				ws.merge_cells "B1:I1"
				(1..@row_writer.number_of_rows - 3).each do |row|
		      row = ws.add_row @row_writer.row(row)
		      row[1].style = key
			    row[3].style = value
				end
				(2..14).each do |row| 
					ws.merge_cells "B#{row}:C#{row}"
					ws.merge_cells "D#{row}:I#{row}"
				end
				blank = ws.add_row ['', '']
				blank[1].style = title
				ws.merge_cells "B15:I15"
				['how_to_get', 'security'].each do |special|
					rows = @row_writer.send special
					ws.add_row ["", I18n.t(special)]
					rows.each { |r| ws.add_row ['', r]}
					ws.add_row ['']
				end
				directions = @row_writer.how_to_get
			end
			p.serialize(file_name)
		end
	end
end
